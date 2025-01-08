{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ./tmux-sessionizer))
  ];

  home.sessionVariables = {
    REPOS = "$HOME/Repos";
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
        extraConfig = /*tmux*/ ''
          # Theme
          source-file ${./tmux-gruvbox-dark.conf}
        '';
      }
    ];

    extraConfig = /*tmux*/ ''
      set -g renumber-windows on
      set -g default-terminal "tmux-256color"
      # undercurl support
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      # support colors for undercurl
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # Split panes using | and -
      bind \\ split-window -h -c '#{pane_current_path}'
      bind | split-window -v -c '#{pane_current_path}'
      unbind '"'
      unbind %

      # Custom binds
      bind i run-shell 'tmux neww tmux-cht.sh'
      bind A run-shell "tmux neww tmux-sessionizer -a"
      bind W run-shell "tmux neww tmux-sessionizer -w"
      bind P run-shell "tmux neww tmux-sessionizer -p"
      bind S run-shell "tmux neww tmux-sessionizer -u"
      bind C run-shell "tmux neww tmux-sessionizer -c"
    '';
  };
}
