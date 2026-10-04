{ config, pkgs, ... }:

{
  # GNOME & GDM aktivieren
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # X11 Keymap für die grafische Oberfläche
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };
}