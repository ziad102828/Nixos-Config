# home/hyprland/rofi.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    # Rofi launchers with Meta key
    bind = $mod, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun
    bind = $mod, TAB, exec, ${pkgs.rofi-wayland}/bin/rofi -show window
    bind = $mod SHIFT, E, exec, ${pkgs.rofi-wayland}/bin/rofi -show power-menu -modi power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu
    bind = $mod, C, exec, ${pkgs.rofi-wayland}/bin/rofi -show calc -modi calc -no-show-match -no-sort
  '';

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