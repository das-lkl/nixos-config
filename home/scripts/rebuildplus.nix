{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "rebuildplus" ''
      read -p "sure you want to rebuild your flake ? (y/n) " ans
      if [ "$ans" = "y" ]; then
        cd ~/nix-config
        git add .
        git commit -m "rebuildplus auto rebuild"
        echo " "
        echo " "
        echo "adding, commiting and pushing to github ---------------------"
        git push
        echo " "
        echo " "
        echo "sudo nixos-rebuild switch --flake .#T14 ---------------------"
        sudo nixos-rebuild switch --flake .#T14
        cd
      fi
    '')
  ];
}