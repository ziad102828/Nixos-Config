{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelPackages = pkgs.linuxPackages_6_1;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = true;

    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.steam-hardware.enable = true;
}
