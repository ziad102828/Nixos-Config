# home/hyprland/waybar.nix
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];
        
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
        };
        
        tray = {
          spacing = 10;
        };
      };
    };
    
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        min-height: 0;
      }
      
      window#waybar {
        background: rgba(21, 18, 27, 0.8);
        color: #cdd6f4;
      }
      
      #workspaces button {
        padding: 0 8px;
        background: transparent;
        color: #cdd6f4;
        border: 2px solid transparent;
      }
      
      #workspaces button.active {
        background: #cba6f7;
        color: #1e1e2e;
        border-radius: 10px;
      }
    '';
  };
}