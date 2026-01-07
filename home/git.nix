{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    # userName = "ziad102828";
    # userEmail = "ziadyehia25@outlook.com"; # Deprecated options
    settings = {
      user = {
        name = "ziad102828";
        email = "ziadyehia25@outlook.com"; # TODO: Update this email
      };
    };
  };
}
