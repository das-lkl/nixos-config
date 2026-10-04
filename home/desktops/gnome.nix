{ config, pkgs, ... }:

{
  # Microsoft Corefonts (bringt Comic Sans MS mit)
  home.packages = with pkgs; [
    corefonts
    roboto
    inter
    gnome-tweaks
    gnome-extension-manager
  ];

  # GTK-Theming 
  gtk = {
    enable = true;
    font = {
      name = "Comic Sans MS";
      size = 11;
      package = pkgs.corefonts;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # GNOME-spezifische Dconf-Registry
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      font-name = "Comic Sans MS 11";
      document-font-name = "Comic Sans MS 11";
    };
  };
}