# In your configuration.nix or modules/cockpit.nix
{ config, pkgs, ... }:

{
  # Enable Cockpit with Podman module
  services.cockpit = {
    enable = true;
    port = 9090;
    # Enable Podman module for Cockpit
    package = pkgs.cockpit.override {
      extraPackages = with pkgs; [
        cockpit-podman
      ];
    };
  };

  # Open firewall port for Cockpit (optional)
  networking.firewall.allowedTCPPorts = [ 9090 ];
}