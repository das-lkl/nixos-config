{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    blender
    gimp
    krita
  ];

}