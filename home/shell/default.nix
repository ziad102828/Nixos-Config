{ pkgs, ... }:

{
  home.packages = [ pkgs.grc ];

  programs.fish = {
    enable = true;
    shellAliases = {
      update = "nix flake update ";
      rebuild = "sudo nixos-rebuild switch --flake ~/Downloads/Nixos-Config-main#nixos";
    };
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      # Enable a plugin (here grc for colorized output)
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };
}
