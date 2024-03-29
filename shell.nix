{ pkgs ? import <nixpkgs> {} }:

let
  overrides = import ./overrides.nix { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = [
    (
      pkgs.poetry2nix.mkPoetryEnv {
        projectDir = ./.;
        overrides = pkgs.poetry2nix.overrides.withDefaults overrides;
      }
    )
    pkgs.python38Packages.poetry
    pkgs.python38Packages.black
    pkgs.nodePackages.pyright
  ];
}
