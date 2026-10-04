{pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    # workbench
    # joplin-desktop  #"broken"
    thunderbird
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE

    # code place
    vscodium

    # terminals
    cool-retro-term
  ];




  
}