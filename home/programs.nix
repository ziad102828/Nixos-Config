{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      ipykernel
      jupyter
      jupyter-client
      jupyter-core
      black
      pylint
      autopep8
      pip
      setuptools
      numpy
      pandas
      matplotlib
      scipy
      seaborn
    ]))
  ];
}
