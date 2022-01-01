{ pkgs ? import <nixpkgs> { } }:
let am = "arknights-mower"; in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ nix-bundle ];
  shellHook = ''exec nix-bundle "(pkgs.callPackage ./. { }).${am}" /bin/${am}'';
}
