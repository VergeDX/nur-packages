{ pkgs ? import <nixpkgs> { } }:
let am = "arknights-mower"; in
let cmd = ''nix-bundle "(pkgs.callPackage ./. { }).${am}" /bin/${am}''; in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ nix-bundle ];
  shellHook = ''exec "${cmd} && cp $(${cmd}) ${am}"'';
}
