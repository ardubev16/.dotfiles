{ config, pkgs, ... }:

{
  home.homeDirectory = "/home/${config.home.username}";
  targets.genericLinux.enable = true;

  imports = [ ./stylix.nix ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    antibody
    bat
    cmake
    curl
    fd
    fzf
    gcc
    gdb
    git
    gpp
    jq
    keyd
    lazygit
    nh
    nushell
    pipx
    ripgrep
    wget
    xclip
    xsel
    xxd
    zip
    zsh
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # gnome-shell = {
    #   enable = true;
    #   # extensions = [
    #   #   { package = pkgs.gnomeExtensions.dashToPanel; }
    #   # ];
    # };

    kitty = {
      enable = true;
      package = config.lib.nixGL.wrap pkgs.kitty;
      settings = {
        hide_window_decorations = true;
        placement_strategy = "top-left";
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "$character$directory$git_branch$git_status";
        right_format = "$cmd_duration$all";
      };
    };
  };
  stylix.targets.kitty.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ardubev_16/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # FLAKE = "~/.dotfiles/nix";
    # EDITOR = "emacs";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
