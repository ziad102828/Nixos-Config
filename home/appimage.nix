# home/appimage.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    appimage-run
    appimagekit
    gearlever
  ];

  programs.fuse.userAllowOther = true;
}
