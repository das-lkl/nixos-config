{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    blender
    gimp
    krita



    # e reader
    # calibre
  ];

}