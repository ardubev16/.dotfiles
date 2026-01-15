{ pkgs, perSystem, ... }:
let
  unstable-pkgs = with perSystem.nixpkgs-unstable; [
    devenv
  ];
in
{
  home.packages =
    with pkgs;
    [
      cmake
      curl
      eza
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
    ]
    ++ unstable-pkgs;

  programs.bat.enable = true;
  stylix.targets.bat.enable = true;

  programs.direnv = {
    enable = true;
    config.global.hide_env_diff = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

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
    note = "vim $HOME/Documents/notes/$(date '+%Y-%m-%d_%a').md";
    tim = ''
      TEMP_FILE=$(mktemp) \
        && echo $TEMP_FILE \
        && vim $TEMP_FILE
      '';
  };

  programs.zsh = {
    enable = true;
    # zprof.enable = true;

    antidote = {
      enable = true;
      plugins = [
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/eza"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/kubectl"
        "ohmyzsh/ohmyzsh path:plugins/zsh-interactive-cd"

        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-syntax-highlighting"
      ];
    };
    initContent = # sh
      ''
        if [[ -f ~/.localvars ]]; then
          source ~/.localvars
        fi
      '';
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;
}
