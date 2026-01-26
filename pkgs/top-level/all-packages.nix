{ pkgs ? import <nixpkgs> {}, ... }:
with pkgs; import ./by-name.nix { inherit pkgs; } // {
  wden = callPackage ../applications/auth/wden/package.nix {};
  eth-wake = callPackage ../applications/lsp/eth-wake/package.nix {};
  firefox-addons = callPackage ../applications/browser/firefox/addons {};
  mpv-scripts = callPackage ./mpv-packages.nix {};

  # FIXME 
  updater = {
    firefox-addons = callPackage ../applications/browser/firefox/addons/firefoxAddonsUpdater.nix {};
  };
}
