# home/hyprland/startup.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "${pkgs.waybar}/bin/waybar"
    "${pkgs.hyprpaper}/bin/hyprpaper"
    "${pkgs.dunst}/bin/dunst"
    "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
    "${pkgs.blueman}/bin/blueman-applet"
    "${pkgs.wireplumber}/bin/wireplumber"
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    
    # Start xdg-desktop-portal-hyprland
    "${pkgs.xdg-desktop-portal-hyprland}/bin/xdg-desktop-portal-hyprland"
    
    # Clipboard manager
    "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
    "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"
  ];
}