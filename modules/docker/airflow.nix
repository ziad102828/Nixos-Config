{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers.airflow = {
      image = "docker.io/apache/airflow:latest";
      ports = [ "8181:8080" ];
      environment = {
        AIRFLOW__CORE__EXECUTOR = "SequentialExecutor";
        AIRFLOW__CORE__LOAD_EXAMPLES = "false";
        _AIRFLOW_DB_MIGRATE = "true";
        _AIRFLOW_WWW_USER_CREATE = "true";
        _AIRFLOW_WWW_USER_USERNAME = "airflow";
        _AIRFLOW_WWW_USER_PASSWORD = "airflow";
      };
      cmd = [ "standalone" ];
      volumes = [
        "airflow-data:/opt/airflow:rw"
      ];
    };
  };
}
