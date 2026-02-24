{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-toolsai.jupyter
      jnoortheen.nix-ide
      ms-python.python
      eamodio.gitlens
      catppuccin.catppuccin-vsc
      vscode-icons-team.vscode-icons
      johnpapa.vscode-peacock
      mhutchie.git-graph
      dbaeumer.vscode-eslint
      alefragnani.bookmarks
      alefragnani.project-manager
      ms-vscode-remote.remote-containers
    ];
  };
}
