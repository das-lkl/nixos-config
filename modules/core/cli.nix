{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Consoleshit & Utilities
    vim
    git
    wget
    pdftk
    tldr
    tree
    btop
    bat
    ripgrep
    cmatrix
    fastfetch

    # Computershit
    cameractrls
    brightnessctl
    wmctrl

    firefox

    
  ];
}