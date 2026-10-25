{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyperrogue
    nethack

    # minecraft
    prismlauncher
    jdk21_headless
  ];
}