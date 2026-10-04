{ pkgs, lib, config, ... }:

{
  options.myApps.creative.enable = lib.mkEnableOption "Kreativ";

  # 2. Wir sagen, was passiert, wenn der Schalter AN ist
  config = lib.mkIf config.myApps.creative.enable {
    home.packages = with pkgs; [
      blender
      gimp
      krita
    ];
  };
}