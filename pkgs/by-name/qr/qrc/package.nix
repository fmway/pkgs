{ lib
, fetchFromGitHub
, buildGoModule
, libsixel
, go
, replaceVars
, ... }:

buildGoModule (finalAttrs: {
  pname = "qrc";
  version = "0.1.1-dev";

  src = fetchFromGitHub {
    owner = "fumiyas";
    repo = "qrc";
    rev = "master";
    hash = "sha256-gkvPr4t9c+COxZr3sXN9+5OyTNGDn2dlhIekmymNvMA=";
  };

  patches = [
    (replaceVars ./add-go-mod.patch {
      version = go.version;
    })
  ];

  proxyVendor = true;

  buildInputs = [
    libsixel
  ];

  vendorHash = "sha256-/RQxF59+6PuqbStPlkkBtBLg1TA6Cj9Zce/SxjI0sDo=";

  meta = {
    description = "QR code generator for text terminals (ASCII art, Sixel)";
    homepage = "https://github.com/fumiyas/qrc";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "qrc";
    platforms = lib.platforms.all;
  };
})
