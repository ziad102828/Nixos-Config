# home/hyprland/keybinds.nix
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    # Mod key
    $mod = SUPER

    # Application launchers
    bind = $mod, RETURN, exec, ${pkgs.kitty}/bin/kitty
    bind = $mod, E, exec, ${pkgs.kdePackages.dolphin}/bin/dolphin
    bind = $mod, R, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun

    # Window management
    bind = $mod, Q, killactive
    bind = $mod, M, exit
    bind = $mod, V, togglefloating
    bind = $mod, P, pseudo
    bind = $mod, J, togglesplit
    bind = $mod, F, fullscreen
    bind = $mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock

    # Focus movement
    bind = $mod, left, movefocus, l
    bind = $mod, right, movefocus, r
    bind = $mod, up, movefocus, u
    bind = $mod, down, movefocus, d

    # Workspace management
    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, 5, workspace, 5
    bind = $mod, 6, workspace, 6
    bind = $mod, 7, workspace, 7
    bind = $mod, 8, workspace, 8
    bind = $mod, 9, workspace, 9
    bind = $mod, 0, workspace, 10

    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, 5, movetoworkspace, 5
    bind = $mod SHIFT, 6, movetoworkspace, 6
    bind = $mod SHIFT, 7, movetoworkspace, 7
    bind = $mod SHIFT, 8, movetoworkspace, 8
    bind = $mod SHIFT, 9, movetoworkspace, 9
    bind = $mod SHIFT, 0, movetoworkspace, 10

    bind = $mod, mouse_down, workspace, e+1
    bind = $mod, mouse_up, workspace, e-1

    # Screenshots
    bind = , PRINT, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
    bind = SHIFT, PRINT, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy

    # Media controls
    bind = , XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
    bind = , XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bind = , XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    # Brightness controls
    bind = , XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%
    bind = , XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-

    # Mouse bindings
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
  '';
}
