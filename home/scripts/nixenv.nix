{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "nixenv" ''
      if [ -z "$1" ]; then
        ls -1 ~/nix-config/shells/*.nix 2>/dev/null | xargs -n 1 basename | sed 's/\.nix$//'
        exit 1
      fi

      SHELL_FILE="$HOME/nix-config/shells/$1.nix"
      
      if [ -f "$SHELL_FILE" ]; then
        echo "Lade Umgebung: $1..."
        nix-shell "$SHELL_FILE"
      else
        echo "$SHELL_FILE existiert nicht."
      fi
    '')
  ];

}