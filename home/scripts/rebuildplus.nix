{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "rebuildplus" ''
      read -p "sure you want to rebuild your flake ? (y/n) " ans
      if [ "$ans" = "y" ]; then
        cd ~/nix-config
        git add .
        git commit -m "rebuildplus"
        git push
        sudo nixos-rebuild switch --flake .#T14
      fi
    '')
  ];
}