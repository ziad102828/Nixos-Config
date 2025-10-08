# home/hyprland/rofi.nix
{ config, pkgs, ... }:

{
  

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "Arc-Dark";
    
    extraConfig = {
      modi = "drun,window,run,ssh";
      show-icons = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      drun-display-format = "{name}";
      disable-history = false;
      sidebar-mode = true;
    };
  };

  home.packages = with pkgs; [
    rofi-power-menu
    rofi-calc
  ];
}