{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hypridle
    hyprlock

    waybar
    rofi-wayland
    dunst
    grim
    slurp
    wl-clipboard
    kitty
    wireplumber
    pavucontrol
    networkmanagerapplet
    brightnessctl
    kdePackages.dolphin  # Fixed this line

    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    cliphist
    playerctl  # Add this for media controls
    swappy     # Add this for screenshot editing
    blueman    # Add this for Bluetooth applet
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # Add Hyprland specific variables
    HYPRLAND_LOG_WLR = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  services.dunst.enable = true;
  
  # Start xdg-desktop-portal with Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };
}