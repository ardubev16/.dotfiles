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
    nh
    pipx
    ripgrep
    wget
    xclip
    xsel
    xxd
    zip
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

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./../dotfiles/starship.toml;

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
}
