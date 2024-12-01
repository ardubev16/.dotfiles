{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$character$directory$git_branch$git_status";
      right_format = "$cmd_duration$all";
    };
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
}
