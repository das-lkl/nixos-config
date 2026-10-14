{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # synology-drive-client
    # grrr Microslop
    zoom-us
  ];
}