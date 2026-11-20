{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    (python3.withPackages (ps: [
      ps.weasyprint
      ps.pip
    ]))
  ];

  shellHook = ''
    python --version
  '';
}