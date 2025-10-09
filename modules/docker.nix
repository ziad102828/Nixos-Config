# services/docker.nix
{ config, pkgs, ... }:

{
  # Enable Docker daemon
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  # Enable Podman (rootless)
  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = true;
  };

  # Enable Cockpit
  services.cockpit = {
    enable = true;
    port = 9090;
    openFirewall = true;
  };

  # Docker & Podman packages (system-wide)
  environment.systemPackages = with pkgs; [
    # Docker
    docker
    docker-compose
    docker-buildx

    # Podman
    podman
    podman-compose
    buildah
    skopeo

    # Cockpit (includes all modules)
    cockpit
  ];

  # Add user to docker and podman groups
  users.users.ziad.extraGroups = [ "docker" "podman" ];

  # Docker daemon configuration
  virtualisation.docker.daemon.settings = {
    experimental = true;
    default-ulimits = {
      nofile = {
        Name = "nofile";
        Hard = 65536;
        Soft = 65536;
      };
    };
  };
}