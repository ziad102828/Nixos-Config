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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  virtualisation.libvirtd.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.waydroid.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
