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
  
  # Base Hyprland configuration
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };
}