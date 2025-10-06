# home/hyprland/config.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    extraConfig = ''
      # Monitor configuration
      monitor=,preferred,auto,auto

      # Input configuration
      input {
          kb_layout = us
          follow_mouse = 1
          touchpad {
              natural_scroll = false
              tap-to-click = true
          }
          sensitivity = 0
      }

      # General appearance
      general {
          gaps_in = 5
          gaps_out = 20
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
          layout = dwindle
          cursor_inactive_timeout = 0
      }

      # Decoration and effects
      decoration {
          rounding = 10
          blur {
              enabled = true
              size = 3
              passes = 1
              new_optimizations = true
          }
          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      # Animations
      animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      # Layout settings
      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_is_master = true
      }

      # Gestures
      gestures {
          workspace_swipe = true
          workspace_swipe_fingers = 3
      }

      # Window rules
      windowrule = float, ^(pavucontrol)$
      windowrule = float, ^(blueman-manager)$
      windowrule = float, ^(nm-connection-editor)$
    '';
  };
}
