{ config, pkgs, ... }:

{
  imports = [
    ./searxng.nix
    ./redlib.nix
    ./airflow.nix
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;   
    defaultNetwork.settings.dns_enabled = true;
  };

  hardware.nvidia-container-toolkit.enable = true;
}
