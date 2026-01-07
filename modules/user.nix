{ config, pkgs, ... }:

{
  # Define a user account.
  users.users.ziad = {
    isNormalUser = true;
    description = "ziad";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      antigravity
      # thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # vim
    # wget
  ];
}
