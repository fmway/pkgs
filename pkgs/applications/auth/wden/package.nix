{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, wayland
, ... }:

rustPlatform.buildRustPackage rec {
  pname = "wden";
  version = "0.14.0";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    wayland
  ];

  src = fetchFromGitHub {
    owner = "luryus";
    repo = "wden";
    rev = version;
    hash = "sha256-oZr7DznCDGfNycde8OMzDRvmLiL8xc2GmMl5s/6zdf8=";
  };

  cargoHash = "sha256-CrMrx+uys4biq7V5B4tDgN621UK58rp4N1lL0bqMbXI=";

  meta = {
    description = "A simple TUI for Bitwarden, written in Rust";
    homepage = "https://github.com/luryus/wden";
    changelog = "https://github.com/luryus/wden/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wden";
  };
}
