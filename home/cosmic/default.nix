{ config, pkgs, inputs, cosmicLib, ... }:

{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager
  ];

  wayland.desktopManager.cosmic = {
    enable = true;

    panels = [
      {
        anchor = cosmicLib.cosmic.mkRON "enum" "Top";
        anchor_gap = true;
        background = cosmicLib.cosmic.mkRON "enum" "Dark";
        expand_to_edges = true;
        margin = 4;
        name = "Panel";
        opacity = 1.0;
        size = cosmicLib.cosmic.mkRON "enum" "M";
        plugins_wings = cosmicLib.cosmic.mkRON "optional" (
          cosmicLib.cosmic.mkRON "tuple" [
            # Left side
            [
              "com.system76.CosmicAppletWorkspaces"
            ]
            # Right side
            [
              "com.system76.CosmicAppletStatusArea"
              "com.system76.CosmicAppletTiling"
              "com.system76.CosmicAppletAudio"
              "com.system76.CosmicAppletNetwork"
              "com.system76.CosmicAppletBattery"
              "com.system76.CosmicAppletPower"
            ]
          ]
        );
        plugins_center = cosmicLib.cosmic.mkRON "optional" [
          "com.system76.CosmicAppletTime"
          "com.system76.CosmicAppletNotifications"
        ];
      }
      {
        anchor = cosmicLib.cosmic.mkRON "enum" "Bottom";
        anchor_gap = true;
        autohide = cosmicLib.cosmic.mkRON "optional" null;
        background = cosmicLib.cosmic.mkRON "enum" "Dark";
        expand_to_edges = true;
        margin = 4;
        name = "Dock";
        opacity = 1.0;
        size = cosmicLib.cosmic.mkRON "enum" "M";
        plugins_center = cosmicLib.cosmic.mkRON "optional" [
          "com.system76.CosmicAppList"
          "com.system76.CosmicAppletMinimize"
        ];
      }
    ];
  };
}
