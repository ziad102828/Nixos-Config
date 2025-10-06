# home/hyprland/default.nix
{ config, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./keybinds.nix
    ./startup.nix
    ./packages.nix
    ./rofi.nix
  ];
}
