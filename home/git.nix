# home/git.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ziad102828";
    userEmail = "ziadyehia25@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "code --wait";
    };
  };
}
