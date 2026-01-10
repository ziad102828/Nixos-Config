{ pkgs, ... }:

{
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    obsidian
    mpv
    unrar
    thunderbird
    freetube
    opencode
    distrobox
    
  ];
}
