{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    docker-buildx

    podman
    podman-compose
    buildah
    skopeo
  ];

  users.users.ziad.extraGroups = [ "docker" ];

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
