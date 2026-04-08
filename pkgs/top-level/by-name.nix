{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; {
  cage-xtmapper = callPackage ../by-name/ca/cage-xtmapper/package.nix {};
  qrc = callPackage ../by-name/qr/qrc/package.nix {};
  voiden = callPackage ../by-name/vo/voiden/package.nix {};
  xdman = callPackage ../by-name/xd/xdman/package.nix {};
}
