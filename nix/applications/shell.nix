{ pkgs, ... }:
{
  programs.bat.enable = true;
  stylix.targets.bat.enable = true;

  home.packages = with pkgs; [
    cmake
    curl
    fd
    fzf
    gcc
    gdb
    git
    gpp
    jq
    pipx
    ripgrep
    wget
    xclip
    xsel
    xxd
    zip
    (writeShellScriptBin "tmux-sessionizer" (builtins.readFile ../bins/tmux-sessionizer))
  ];

  home.shellAliases = {
    # better commands
    ivm = "vim"; # because I can't type
    mkdir = "mkdir -pv";
    tmx = "tmux -2u a || tmux -2u";
    cat = "bat";

    # grep
    agrep = "alias | grep";
    hgrep = "history | grep";
    psgrep = "ps aux | grep";

    # network
    ports = "netstat -tulanp";
    wget = "wget -c";
    ipe = "curl -s ipinfo.io | jq";
    site-dl = "wget --random-wait -rpe robots=off -U mozilla";

    # misc
    open = "xdg-open";
    xsc = "xclip -selection clipboard";
    abup = "antibody bundle < $ZDOTDIR/99-plugins.txt > $ZDOTDIR/.plugins && exec zsh";
    ez = "exec zsh";
    gspull = "git pull && git submodule foreach \"git checkout master\"";
    rpg = "openssl rand -hex";
  };

  programs.zsh = {
    enable = true;
    antidote = {
      enable = true;
      plugins = [
        "lukechilds/zsh-nvm"

        "ohmyzsh/ohmyzsh"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "ohmyzsh/ohmyzsh path:plugins/docker kind:fpath"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/node"
        "ohmyzsh/ohmyzsh path:plugins/npm"
        "ohmyzsh/ohmyzsh path:plugins/virtualenv"
        "ohmyzsh/ohmyzsh path:plugins/web-search"
        "ohmyzsh/ohmyzsh path:plugins/zsh-interactive-cd"

        "changyuheng/fz"

        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-syntax-highlighting"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ../dotfiles/starship.toml;

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
        extraConfig = ''
          # Theme
          source-file ${../dotfiles/tmux-gruvbox-dark.conf}
        '';
      }
    ];

    extraConfig = ''
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
