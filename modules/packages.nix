{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget
    curl
    htop
    neofetch
  firefox
  git
    vim
    neovim
    vscode
    tree
    quick-webapps

  thunderbird
    vlc
    mpv
    distrobox
    boxbuddy
    grc
    

    unzip
    file
    tree

  ];
  programs.fish.enable = true;}
