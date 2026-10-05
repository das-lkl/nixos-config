{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    corefonts # Microsoft fonts
    roboto
    inter
    google-fonts # Google fonts



    gnome-tweaks
    gnome-extension-manager
  ];

  # GTK-Theming 
  gtk = {
    enable = true;
    font = {
      name = "Yuyu Short";
      size = 11;
      package = pkgs.google-fonts;
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
      font-name = "Yuyu Short 11";
      document-font-name = "Yuyu Short 11";
    };
  };
}