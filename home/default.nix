# home/default.nix
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscode.nix
    ./hyprland
    ./programs.nix
  ./fish.nix
    ];

  home = {
    username = "ziad";
    homeDirectory = "/home/ziad";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;


}
