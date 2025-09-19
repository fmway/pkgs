{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
, openjdk17
, sdl3
, sdl2-compat
, pkg-config
, libsndfile
, ...
}:

stdenv.mkDerivation rec {
  pname = "libopensles-standalone";
  version = "unstable-2024-02-21";

  src = fetchFromGitLab {
    owner = "android_translation_layer";
    repo = "libopensles-standalone";
    rev = "605a83f47263a022427afb6e95801bd39b459b78";
    hash = "sha256-YKGAs4AdKmYKstF4ObDpy1WMXM5zJjhnN/CBOzaly6g=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    openjdk17
    sdl2-compat
    sdl3
    libsndfile
  ];

  meta = {
    description = "A lightly patched version of google's libOpenSLES implementation by android_translation_layer";
    homepage = "https://gitlab.com/android_translation_layer/libopensles-standalone.git";
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "libopensles-standalone";
    platforms = lib.platforms.all;
  };
}
