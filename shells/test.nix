{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  
  buildInputs = with pkgs; [
    calibre
    # obs-studio
  ];

  # Skript, das beim Starten der Shell ausgeführt wird
  shellHook = ''
    echo "reed some books girl"
  '';
}