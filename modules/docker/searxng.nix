{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.searxng = {
      image = "docker.io/searxng/searxng:latest";
      ports = [ "8889:8080" ];
      environment = {
        SEARXNG_BASE_URL = "http://localhost:8889";
      };
      volumes = [
        "searxng-data:/etc/searxng:rw"
      ];
    };
  };
}
