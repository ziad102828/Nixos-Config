{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
    protontricks.enable = true;
    extest.enable = true; # For Wayland input translation
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamescope.enable = true;
}
