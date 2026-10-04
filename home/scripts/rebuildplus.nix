{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "rebuildplus" ''
      read -p "sure you want to rebuild your flake ? (y/n) \n" ans
      if [ "$ans" = "y" ]; then
        cd ~/nix-config
        git add .
        git commit -m "rebuildplus auto rebuild"
        echo "\n ...adding, commiting and pushing to github ---------------------"
        git push
        echo "\n ...sudo nixos-rebuild switch --flake .#T14 ---------------------"
        sudo nixos-rebuild switch --flake .#T14
        cd
      fi
    '')
  ];
}