{ pkgs ? import <nixpkgs> {}, ... }: let
  mpv-scripts = import ./mpv-packages.nix { inherit pkgs; };
  by-names = import ./by-name.nix { inherit pkgs; };
  inherit (pkgs) callPackage;
in by-names // {
  eth-wake = callPackage ../applications/lsp/eth-wake/package.nix {};
  firefox-addons = callPackage ../applications/browser/firefox/addons {};

  # FIXME 
  updater = {
    firefox-addons = callPackage ../applications/browser/firefox/addons/firefoxAddonsUpdater.nix {};
  };
  waydroid-su = callPackage ../applications/privileges/waydroid-su/package.nix {};
  wden = callPackage ../applications/auth/wden/package.nix {};
  mpv-scripts = let all = pkgs.lib.attrValues mpv-scripts; in pkgs.symlinkJoin {
    name = "mpv-script";
    paths = all;
    passthru = mpv-scripts;
  } // { inherit all; };
}
