{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    python310
    python310Packages.pip
    python310Packages.virtualenv
  ];

  shellHook = ''
    python --version
  '';
}