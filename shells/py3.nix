{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    python3Packages.pip
    virtualenv
  ];

  shellHook = ''
    python --version
  '';
}