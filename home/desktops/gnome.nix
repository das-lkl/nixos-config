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
      name = "Just Me Again Down Here";
      size = 13;
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
      font-name = "Just Me Again Down Here 13";
      document-font-name = "Just Me Again Down Here";
    };
  };
}