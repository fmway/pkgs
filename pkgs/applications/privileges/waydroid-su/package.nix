{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, dbus
, systemdLibs
, libcap
, bzip2
, xz
, ... }:

rustPlatform.buildRustPackage rec {
  pname = "wsu";
  version = "0.1.2";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    dbus
    systemdLibs
    libcap
    bzip2
    xz
  ];

  src = fetchFromGitHub {
    owner = "mistrmochov";
    repo = "WaydroidSU";
    rev = version;
    hash = "sha256-ICC/lTUSUpeg/RZOfLJzplt3aQBXlNg1ng8yANGVMgA=";
  };

  cargoHash = "sha256-kweqiD7UyS8Tm9bPvjGx6V91uUf2xLQtxw5L5frFuOw=";

  meta = {
    description = "WaydroidSU, CLI Magisk manager and installer for Waydroid written in Rust";
    homepage = "https://github.com/mistrmochov/WaydroidSU";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "waydroid-su";
  };
}
