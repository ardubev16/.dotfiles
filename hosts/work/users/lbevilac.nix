{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.ai = true;

  home.packages =
    with pkgs;
    [
      git-filter-repo
      git-lfs
      gnumake
      htop
      nushell
      powershell
      prek
      trivy
      uv
      yarn
      yazi
    ];

  home.shellAliases = {
    # Open Ansible logs in a temporary file from the clipboard, also add newlines
    ansilog = ''
      TEMP_FILE=$(mktemp) \
        && xclip -select clipboard -out | sed "s/\\\\n/\\n/g" > $TEMP_FILE \
        && vim $TEMP_FILE \
    '';
  };
}
