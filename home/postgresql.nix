# home/postgresql.nix
{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = false;
    authentication = ''
      local all all trust
    '';
  };

  home.packages = with pkgs; [
    postgresql_16  # Includes pg_bench
    pgadmin4       # GUI administration tool
  ];
}
