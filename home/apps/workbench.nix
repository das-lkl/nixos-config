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

    vlc

    # code place
    vscodium

    # terminals
    cool-retro-term
    
  ];

  home.file = {
    ".config/cool-retro-term".source = ../../dotfiles/config-cool-retro-term;
    ".local/share/cool-retro-term".source = ../../dotfiles/share-cool-retro-term;
  };
  
}