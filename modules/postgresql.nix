# modules/postgresql.nix (system level)
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

  environment.systemPackages = with pkgs; [
    postgresql_16
    pgadmin4
  ];

  users.users.ziad.extraGroups = [ "postgres" ];
}