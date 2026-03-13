{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Game Launchers
    steam
    lutris
    heroic               
    winetricks           
    protontricks         
    protonup-qt         
    mangohud            
    gamemode            
    gamescope            
  ];
}
