{ config, pkgs, inputs, ... }:

{
  imports = [
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    alacritty
    fuzzel
    waybar
    swaylock
    mako
    wl-clipboard
    brightnessctl
    playerctl
  ];
}
