{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];

services.cockpit = {
  enable = true;
  port = 9090;
};


}
