{ config, pkgs, lib, ... }:

let
  userDirs = [
    "Downloads"
    "Documents"
    "Videos"
    "Pictures"
    "Games"
    "git"
    "vms"
  ];

  mkdirCmds = lib.concatMapStringsSep "\n" (dir: "mkdir -p ~/${dir}") userDirs;
in
{
  home.activation.createUserDirs = config.lib.dag.entryAfter [ "writeBoundary" ] mkdirCmds;
}
