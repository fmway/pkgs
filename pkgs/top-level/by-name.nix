{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; {
  android-translation-layer = callPackage ../by-name/an/android-translation-layer/package.nix {};
  cage-xtmapper = callPackage ../by-name/ca/cage-xtmapper/package.nix {};
  ktechlab = callPackage ../by-name/kt/ktechlab/package.nix {};
  qrc = callPackage ../by-name/qr/qrc/package.nix {};
  voiden = callPackage ../by-name/vo/voiden/package.nix {};
  xdman = callPackage ../by-name/xd/xdman/package.nix {};
}
