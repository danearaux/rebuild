{ pkgs, system }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    glibc
    rustup
    python313
    uv
    shellcheck
    go
    go-tools
    lua
    luarocks
    gcc
    bison
    direnv
    nodejs
    ruby
    jdk # Java development kit
    android-tools
    swift
    perl
    zig
    automake
    autoconf
    gnumake
    libtool
  
    strace
    ltrace
    perf-tools
    ninja
    cmake
    meson
    just
    jq #json files
    yq #yaml files
    fh
    git
    gh
    neovim
    vscode
    ripgrep-all
    nixpkgs-fmt # Formatter
    alejandra # Formatter
  ];
}
