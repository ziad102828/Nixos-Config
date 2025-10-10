{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
  services.desktopManager.plasma6.enable = true;
  
  # Enhanced PipeWire configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # XDG Desktop Portal for screensharing - FIXED
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde  # Qt 6 version for Plasma 6
      xdg-desktop-portal-gtk
    ];
  };

  # Virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.waydroid.enable = true;

  # Environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Add these for better Wayland support
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  # Required services
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  
  # User groups for audio/video access
  users.users.ziad.extraGroups = [ "audio" "video" "pipewire" ];

  # Optional: Enable necessary kernel modules
  boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];
}