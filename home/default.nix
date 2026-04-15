{ config, pkgs, ... }:

{
  imports = [
    ./programming
    ./shell
    ./niri
    ./noctalia
    ./cosmic
    ./gnome
    ./scripts
    ./gaming.nix
  ];

  home.username = "ziad";
  home.homeDirectory = "/home/ziad";

  
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
   mpv
    #unrar
    thunderbird
    pavucontrol
    opencode
    gemini-cli
    #cloudflare-warp
    grim
    flameshot
    linux-wallpaperengine
    kdePackages.okular
  ];

  
  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_GTK_TITLEBAR_DECORATION = "system";
  };

  programs.home-manager.enable = true;
}
