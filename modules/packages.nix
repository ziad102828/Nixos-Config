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

  thunderbird
    vlc
    mpv

    unzip
    file
    tree

  ];
  programs.fish.enable = true;}
