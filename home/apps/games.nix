{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # minecraft
    prismlauncher
    jdk21_headles
    
    # runescape
    bolt-launcher
    runelites
  ];
}