# home/appimage.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    appimage-run
    
    gearlever
  ];
}