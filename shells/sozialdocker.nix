{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "Docker Sozialreferat";
  packages = with pkgs; [
      
    
    ];

    virtualisation.docker = {
      enable = true;
    };


  shellHook = ''
    echo "Shell loaded"
  '';
}