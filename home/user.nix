{ config, pkgs, ... }:

{
  imports = [
    ./apps 
    ./desktops
    ./scripts
  ];

  home.username = "lkl";
  home.homeDirectory = "/home/lkl";
  home.stateVersion = "26.05";

  # Deine alltäglichen GUI-Programme und Werkzeuge
  home.packages = with pkgs; [
    # joplin-desktop
    thunderbird
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE

    # Codium
    vscodium
    ];

  # Programme mit eigener Konfiguration
  programs.firefox.enable = true;
  # switches
  myApps.creative.enable = false;
  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "das-lkl";
        email = "git@kleiner-paul.com";
      };
    };
  };

  programs.home-manager.enable = true;

}