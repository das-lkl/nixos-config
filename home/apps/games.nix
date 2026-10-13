{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyperrogue
    nethack
  ];
}