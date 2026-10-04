{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "cpp-dev-shell";

  # Pakete, die für die C++ Entwicklung benötigt werden
  buildInputs = with pkgs; [
    gcc           # C/C++ Compiler
    gnumake       # Build-Automatisierung (Makefiles)
    cmake         # Modernes Build-System
    gdb           # GNU Debugger
    valgrind      # Memory-Debugging und Profiling
    clang-tools   # Stellt 'clangd' als Language Server für IDEs (VS Code, Neovim) bereit
    sdl3
    # obs-studio
  ];

  # Skript, das beim Starten der Shell ausgeführt wird
  shellHook = ''
    echo "========================================"
    echo "C++ Entwicklungsumgebung aktiv!"
    echo "Compiler: $(gcc --version | head -n 1)"
    echo "CMake:    $(cmake --version | head -n 1)"
    echo "========================================"
  '';
}