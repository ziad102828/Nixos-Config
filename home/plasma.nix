{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    session = {
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };

    configFile = {
      "krunnerrc"."General"."FreeFloating" = true;
      "krunnerrc"."General"."HistoryEnabled" = false;
      "krunnerrc"."Plugins"."baloosearchEnabled" = true;
      "krunnerrc"."Plugins"."calculatorEnabled" = true;
      "krunnerrc"."Plugins"."shellEnabled" = true;
    };

    shortcuts = {
      "ksmserver"."Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      "kwin"."Switch to Desktop 1" = "Meta+1";
      "org.kde.krunner.desktop"."_launch" = [ "Alt+Space" ];
    };

    # files = {
    #   "kdeglobals"."General"."BrowserApplication" = "firefox.desktop";
    #   "kdeglobals"."General"."TerminalApplication" = "konsole.desktop";
    # };
  };
}
