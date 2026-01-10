{ config, pkgs, ... }:

{
  # Install docker-compose if not already globally available, though usually good to have in environment
  home.packages = [ pkgs.docker-compose ];

  # Place the compose file in a managed location
  xdg.configFile."portainer/docker-compose.yml".source = ./portainer.yml;

  systemd.user.services.portainer = {
    Unit = {
      Description = "Portainer Service via Docker Compose";
    };

    Service = {
      Type = "simple";
      # %h resolves to the user's home directory
      ExecStart = "${pkgs.docker-compose}/bin/docker-compose -f %h/.config/portainer/docker-compose.yml up --remove-orphans";
      ExecStop = "${pkgs.docker-compose}/bin/docker-compose -f %h/.config/portainer/docker-compose.yml down";
      Restart = "always";
      RestartSec = "10s";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
