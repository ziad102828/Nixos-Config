{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ziad = {
    isNormalUser = true;
    description = "ziad";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.falkon
      antigravity
      quick-webapps
    #  thunderbird
    ];
  };

  programs.fish.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
}
