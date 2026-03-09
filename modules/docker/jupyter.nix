{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.jupyter = {
      image = "docker.io/tensorflow/tensorflow:latest-gpu-jupyter";
      ports = [ "8888:8888" ];
      environment = {
        JUPYTER_ENABLE_LAB = "yes";
        JUPYTER_TOKEN = "jupyter";
        NVIDIA_VISIBLE_DEVICES = "all";
        NVIDIA_DRIVER_CAPABILITIES = "all";
      };
      extraOptions = [
        "--device=nvidia.com/gpu=all"
      ];
      volumes = [
        "jupyter-data:/tf/notebooks:rw"
      ];
    };
  };
}
