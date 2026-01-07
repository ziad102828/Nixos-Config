{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    session = {
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };

    # shortcuts = {
    #   "ksmserver"."Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
    #   "kwin"."Switch to Desktop 1" = "Meta+1";
    # };

    # files = {
    #   "kdeglobals"."General"."BrowserApplication" = "firefox.desktop";
    #   "kdeglobals"."General"."TerminalApplication" = "konsole.desktop";
    # };
  };
}
