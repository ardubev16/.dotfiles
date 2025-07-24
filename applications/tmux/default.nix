{ pkgs, config, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ./tmux-sessionizer))
    (pkgs.writeShellScriptBin "tmux-session-mngr" (builtins.readFile ./tmux-session-mngr))
  ];

  home.sessionVariables = {
    REPOS = "${config.home.homeDirectory}/Repos";
  };

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

    extraConfig = # tmux
      ''
        set-option -g renumber-windows on
        set-option -g default-terminal "tmux-256color"
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

        bind-key A display-popup -E tmux-sessionizer -a
        bind-key W display-popup -E tmux-sessionizer -w
        bind-key P display-popup -E tmux-sessionizer -p
        bind-key U display-popup -E tmux-sessionizer -u
        bind-key S display-popup -E tmux-sessionizer -s

        bind-key t display-popup -E tmux-session-mngr -t
        bind-key X display-popup -E tmux-session-mngr -c
        bind-key M run-shell 'tmux-session-mngr -m'
        bind-key N run-shell 'tmux-session-mngr -u'

        bind-key -n M-o switch-client -p
        bind-key -n M-i switch-client -n
      '';
  };
}
