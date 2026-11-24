{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.packages = [
    (pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ./tmux-sessionizer))
    (pkgs.writeShellApplication {
      name = "tmux-claude-usage";
      runtimeInputs = [
        pkgs.curl
        pkgs.jq
        pkgs.sqlite
      ];
      text = builtins.readFile ./tmux-claude-usage;
    })
  ];

  home.sessionVariables = {
    REPOS = "${config.home.homeDirectory}/Repos";
  };

  # TODO: use tmuxPlugins.mkTmuxPlugin + fetchFromGitHub once tmux-agents is stable enough
  # (drops the TPM checkout and the skipped first run on fresh machines).
  # Idempotent: install.sh strips its own hooks before re-adding them.
  home.activation.tmuxAgentsIntegrations = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    script="${config.xdg.configHome}/tmux/plugins/tmux-agents/integrations/install.sh"
    if [[ -x $script ]]; then
      PATH="${pkgs.jq}/bin:$PATH" run "$script" install
    fi
  '';

  programs.zsh.initContent = # sh
    ''
      __trap_exit_tmux() {
        [[ -z "$TMUX" ]] && return  # Not in tmux, ignore

        # Ignore if more than one window or pane exists
        local win_count=$(tmux list-windows 2>/dev/null | wc -l)
        local pane_count=$(tmux list-panes 2>/dev/null | wc -l)
        [[ $win_count -ne 1 || $pane_count -ne 1 ]] && return

        # If in default session, create a new window instead of closing session
        local default_session_name="0"
        local current_session=$(tmux display-message -p '#{session_name}')
        [[ "$current_session" == "$default_session_name" ]] && tmux new-window

        # Switch client to default session if closing attached session
        local is_session_attached=$(tmux display-message -p '#{session_attached}')
        [[ "$is_session_attached" -ne 0 ]] && tmux switch-client -t "$default_session_name"
      }

      # Only set the trap in interactive shells
      if [[ $- == *i* ]]; then
        trap __trap_exit_tmux EXIT
      fi
    '';

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    shortcut = "a";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.mode-indicator;
        extraConfig = # tmux
          ''
            # Theme
            source-file ${./tmux-gruvbox-dark.conf}
          '';
      }
    ];

    extraConfig = # sh
      ''
        set-option -g renumber-windows on
        set-option -g default-terminal "tmux-256color"
        set-option -g allow-passthrough on
        set-option -s extended-keys on
        set-option -as terminal-features 'xterm*:extkeys'
        # undercurl support
        set-option -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
        # support colors for undercurl
        set-option -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

        # Split panes with current path
        bind-key % split-window -h -c '#{pane_current_path}'
        bind-key '"' split-window -v -c '#{pane_current_path}'

        # Custom binds
        bind-key R run-shell '\
          tmux source-file ${config.xdg.configHome}/tmux/tmux.conf; \
          tmux display-message "Sourced config file!"'
        bind-key s choose-tree -sZ -O name

        bind-key A display-popup -E tmux-sessionizer -a
        bind-key S display-popup -E tmux-sessionizer -s

        bind-key -n M-o switch-client -p
        bind-key -n M-i switch-client -n

        set-option -g @tmux_agents_worktree_dir "$REPOS/.worktrees"
        set-option -g @tmux_agents_worktree_command 'omp'
        set-option -g @tmux_agents_dashboard_build 'on'
        set-option -g @plugin 'ardubev16/tmux-agents'

        run '~/.tmux/plugins/tpm/tpm'
      '';
  };
}
