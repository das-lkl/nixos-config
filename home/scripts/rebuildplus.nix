{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "rebuildplus" ''
      cd ~/nix-config
      git add .
      git commit -m "rebuildplus"
      git push
      sudo nixos-rebuild switch --flake .#T14
    '')
  ];

}