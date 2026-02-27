{ config, pkgs, ... }:

{
  imports = [
    ./programming
    ./shell
    ./niri
    ./noctalia
    ./cosmic
    ./scripts
  ];

  home.username = "ziad";
  home.homeDirectory = "/home/ziad";

  
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    obsidian
    mpv
    unrar
    thunderbird
    freetube
    opencode
    distrobox
    gemini-cli
    cloudflare-warp
    kdePackages.gwenview
    grim
    flameshot
  ];

  
  home.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_GTK_TITLEBAR_DECORATION = "system";
  };

  programs.home-manager.enable = true;
}
