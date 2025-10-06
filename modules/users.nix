{ config, pkgs, ... }:

{
  users.users.ziad = {
    isNormalUser = true;
    description = "ziad";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "podman" "pipewire" "audio" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
      flatpak
      home-manager
    ];
    initialPassword = "temp-password-123";
    shell = pkgs.fish;
  };
}
