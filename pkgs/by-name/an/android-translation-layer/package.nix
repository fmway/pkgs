{ lib
, binutils
, stdenv
, fetchFromGitLab
, wayland-protocols
, ant
, meson
, ninja
, cmake
, pkg-config
, callPackage
, alsa-lib
, ffmpeg
, libcap
, libdrm
, glib
, gtk4
, libgudev
, openxr-loader
, wolfssl
, bionic-translation
, art-standalone
, libportal
, sqlite
, webkitgtk_6_0
, lz4
, libwebp
, libbsd
, openjdk17
, replaceVars
# , pkgs
, libGL
, wayland-scanner
, cairo
, wayland
, makeWrapper
, graphene
, harfbuzz
, libglvnd
, libsoup_3
, pango
, vulkan-loader
, ...
}: let
  libopensles-translation = callPackage ./libopensles-translation.nix {};
  packages = [
    vulkan-loader
    pango
    libglvnd
    art-standalone
    libsoup_3
    libopensles-translation
    libGL
    harfbuzz
    alsa-lib
    glib
    gtk4
    sqlite
    webkitgtk_6_0
    wayland
    libportal
    ffmpeg
    libcap
    libdrm
    libgudev
    cairo
    graphene
  ];

  libPath = lib.makeLibraryPath packages + ":${art-standalone}/lib/art";
in stdenv.mkDerivation (finalAttrs: {
  pname = "android-translation-layer";
  version = "unstable-2025-09-03";

  src = fetchFromGitLab {
    owner = "android_translation_layer";
    repo = "android_translation_layer";
    rev = "cf93a172b9238e6612b778c7ab76013acebf0ef8";
    hash = "sha256-nnwefW8802ctJRY0aqL+D6MK713eoiQ5K6oVnm5fUOQ=";
  };

  patches = [
    (replaceVars ./some.patch {
      lib-art-standalone = "${art-standalone}/lib";
    })
  ];

  nativeBuildInputs =
  # with pkgs;
  [
    makeWrapper
    meson
    ninja
    pkg-config
    cmake
    bionic-translation
    art-standalone
    glib
  ];

  buildInputs =
  packages ++
  [
    wayland-scanner
    wayland-protocols
    cmake
    openxr-loader
    ant
    (wolfssl.override {
      variant = "jni";
      extraConfigureFlags = [
        "--enable-shared"
        "--disable-opensslall"
        "--disable-opensslextra"
        "--enable-aescbc-length-checks"
        "--enable-curve25519"
        "--enable-ed25519"
        "--enable-ed25519-stream"
        "--enable-oldtls"
        "--enable-base64encode"
        "--enable-tlsx"
        "--enable-scrypt"
        "--disable-examples"
        "--enable-crl"
      ];
    })
    bionic-translation
    lz4
    libwebp
    libbsd
    openjdk17
  ];

  fixupPhase = ''
    mkdir -p $out/lib/java/dex/microg
    install -m600 $src/com.google.android.gms.apk $out/lib/java/dex/microg/
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$out/bin/$pname"
    wrapProgram $out/bin/$pname \
      --set "LD_LIBRARY_PATH" "${libPath}:$out/lib/java/dex/android_translation_layer/natives" \
      --set "PATH" "${lib.makeBinPath [
        binutils
      ]}"
  '';

  meta = {
    description = "A translation layer that allows running Android apps on a Linux system";
    homepage = "https://gitlab.com/android_translation_layer/android_translation_layer";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "android-translation-layer";
    platforms = lib.platforms.all;
  };
})
