# home/hyprland/startup.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    # Startup applications
    exec-once = ${pkgs.waybar}/bin/waybar
    exec-once = ${pkgs.hyprpaper}/bin/hyprpaper
    exec-once = ${pkgs.dunst}/bin/dunst
    exec-once = ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator
    exec-once = ${pkgs.wireplumber}/bin/wireplumber
    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  '';
}
