{ stdenv
, fetchurl
, lib
, dpkg
, pkgs
, wrapGAppsHook3
, ... }: let
  pname = "voiden";
  version = "0.9.31";
  hash = {
    "x86_64-linux" = "sha256-mUZb6DJvmqkIAbyT5LFwHX+AUS3LXL2ovaODbC6SCEU=";
  }."${stdenv.system}";

  arch = {
    "x86_64-linux" = "amd64";
  }."${stdenv.system}";

  
  libPath = lib.makeLibraryPath ((with pkgs; [
    glib
    nss
    nspr
    dbus
    atk
    cups
    libdrm
    libgbm
    libnotify
    gtk3
    pango
    cairo
    expat
    libxkbcommon
    alsa-lib
    libGL
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXrandr
    libxcb
  ]));

in stdenv.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://voiden-releases.s3.eu-west-1.amazonaws.com/voiden/linux/x64/voiden_${version}_${arch}.deb";
    inherit hash;
  };

  dontBuild = true;
  dontConfigure = true;

  unpackPhase = ''
    dpkg-deb --fsys-tarfile $src | tar -x --no-same-owner
  '';

  installPhase = ''
    mkdir $out
    cp -r usr/* $out/
  '';

  nativeBuildInputs = [
    wrapGAppsHook3
  ];
  buildInputs = [
    dpkg
  ];

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix LD_LIBRARY_PATH : ${libPath}
    )
  '';

  meta = {
    description = "The Offline API Client - Git-native. Modular. Extensible. Made for devs who build.";
    homepage = "https://voiden.md/";
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [  ];
  };
}
