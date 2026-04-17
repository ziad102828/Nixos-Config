{ config, pkgs, ... }:

{
  users.users.ziad = {
    isNormalUser = true;
    description = "ziad";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      antigravity
    proton-vpn
    visidata
    ];
  };

  programs.fish.enable = true;

  programs.firefox.enable = true;
}
