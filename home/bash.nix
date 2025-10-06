# home/bash.nix
{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "erasedups" "ignoredups" ];
    historyIgnore = [ "ls" "cd" "exit" ];

    shellAliases = {
      ll = "ls -la";
      nupdate = "sudo nixos-rebuild switch --flake ~/Documents/nixos-config#nixos";
      nix-gc = "sudo nix-collect-garbage --delete-older-than 7d";
      nhup = "home-manager switch --flake ~/Documents/nixos-config#ziad";
    };

    initExtra = ''
      # Custom prompt
      export PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ '

      # History settings
      export HISTSIZE=10000
      export HISTFILESIZE=20000
      shopt -s histappend
    '';
  };
}
