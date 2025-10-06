# home/fish.nix (alternative approach)
{ config, pkgs, ... }:

let
  omfPkgs = with pkgs; [
    oh-my-fish
    fishPlugins.bobthefish  # Popular theme
    fishPlugins.z           # Directory jumping
    fishPlugins.grc         # Generic colorizer
  ];
in
{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -la";
      nupdate = "sudo nixos-rebuild switch --flake ~/Documents/github/Nixos-Config/";
      nhup = "home-manager switch --flake ~/Documents/github/Nixos-Config/";
      dps = "docker ps";
      dclean = "~/.local/bin/docker-scripts/cleanup.sh";
    };


  };

  home.packages = omfPkgs;

  programs.bash.enable = false;
}
