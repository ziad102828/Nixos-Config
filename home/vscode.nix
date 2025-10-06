# home/vscode.nix
{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-python.vscode-pylance
        ms-python.black-formatter
        ms-python.isort

        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow

        jnoortheen.nix-ide


      ];

      userSettings = {
        "python.defaultInterpreterPath" = "/home/ziad/.local/state/nix/profile/bin/python";
        "python.analysis.autoImportCompletions" = true;
        "python.formatting.provider" = "black";
        "jupyter.jupyterServerType" = "local";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "editor.fontSize" = 14;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      };
    };
  };

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];
}
