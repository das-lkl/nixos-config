{ config, pkgs, ... }:

{
  imports = [
    ./apps 
    ./desktops
    ./scripts
  ];

  home.username = "lkl";
  home.homeDirectory = "/home/lkl";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    vim
  ];
  

  programs.home-manager.enable = true;

}