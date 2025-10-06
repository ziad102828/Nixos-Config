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
    kdePackages.dolphin

    xdg-desktop-portal-hyprland
    cliphist
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  services.dunst.enable = true;
}
