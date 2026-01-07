{ pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    lutris
    protontricks
    # mangohud is enabled via program below, which installs the package
    protonup-qt
    gamescope
    goverlay
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      cpu_temp = true;
      gpu_temp = true;
      ram = true;
      vram = true;
      fps = true;
      frametime = false;
      frame_timing = false;
    };
  };


}
