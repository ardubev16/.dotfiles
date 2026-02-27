{
  inputs,
  perSystem,
  pkgs,
  ...
}:
let
  unstable-pkgs = with perSystem.nixpkgs-unstable; [
    awscli2 # >= 2.32.15
  ];
in
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  global.toolsets.ai = true;

  home.packages =
    with pkgs;
    [
      azure-cli
      git-filter-repo
      git-lfs
      gnumake
      hclfmt
      htop
      kmonad
      nushell
      powershell
      prek
      spotify
      teams-for-linux
      telegram-desktop
      terraform
      terragrunt
      tflint
      trivy
      uv
      yarn
      yazi
    ]
    ++ [
      crc
      openshift
      tektoncd-cli
    ]
    ++ unstable-pkgs;

  home.shellAliases = {
    # Open Ansible logs in a temporary file from the clipboard, also add newlines
    ansilog = ''
      TEMP_FILE=$(mktemp) \
        && xclip -select clipboard -out | sed "s/\\\\n/\\n/g" > $TEMP_FILE \
        && vim $TEMP_FILE
    '';
  };
}
