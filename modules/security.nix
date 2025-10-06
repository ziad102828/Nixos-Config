{ config, pkgs, ... }:

{
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
    updater.interval = "daily";
  };

  services.clamav.scanner.enable = true;
}
