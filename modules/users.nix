{ config, pkgs, ... }:

{
  users.users.ziad = {
    isNormalUser = true;
    description = "ziad";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.falkon
      antigravity
     librewolf
      quick-webapps
      freetube
      github-desktop
    protonvpn-gui
    visidata
    ];
  };

  programs.fish.enable = true;

  programs.firefox.enable = true;
}
