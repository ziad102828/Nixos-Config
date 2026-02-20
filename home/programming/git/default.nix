{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ziad102828";
        email = "ziadyehia25@outlook.com";
      };
    };
  };
}
