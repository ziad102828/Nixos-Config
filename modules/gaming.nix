{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;  # Disabled
    dedicatedServer.openFirewall = false;  # Disabled
  };

  environment.systemPackages = with pkgs; [
    steam
    lutris

    wineWowPackages.stable
    winetricks
    protontricks
    protonup-qt

    gamemode
    mangohud
    gamescope

    vulkan-loader
    vulkan-tools
  ];

  programs.gamemode.enable = true;



  users.users.ziad.extraGroups = [ "audio" "video" "input" "wheel" ];
}
