{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.redlib = {
      image = "quay.io/redlib/redlib:latest";
      ports = [ "8080:8080" ];
      environment = {
        REDLIB_DEFAULT_SHOW_NSFW = "off";
        REDLIB_DEFAULT_USE_HLS = "on";        # use HLS for video playback
        REDLIB_DEFAULT_HIDE_HLS_NOTIFICATION = "on";
        REDLIB_DEFAULT_VIDEO_QUALITY = "best";
      };
    };
  };
}
