{ lib , cage , fetchurl , pkgs }: let
  pname = "cage_xtmapper";
  version = "0.2.0";

  script = fetchurl {
    url = "https://raw.githubusercontent.com/Xtr126/cage-xtmapper/refs/heads/v${version}/cage_xtmapper.sh";
    hash = "sha256-af2G1eeEXIKFxQHzOH0XPVUQ34mWBrd2Q/IlmmDUZPc=";
  };
  
  scanPatches = dir:
    map (x:
        "${dir}/${x}"
      ) (builtins.attrNames (lib.filterAttrs (k: _: lib.hasSuffix ".patch" k) (builtins.readDir "${dir}")));

  cageFixDep = cage.override (old: {
    wlroots_0_19 = old.wlroots_0_19.overrideAttrs (o: {
      patches = o.patches or [] ++ scanPatches ./wlroots_patches;
      enableXWayland = false;
    });
  });

in cageFixDep.overrideAttrs (finalAttrs: prevAttrs: {
  inherit pname version;

  patches = prevAttrs.patches ++ scanPatches ./.;
  src = cage.src;

  mesonFlags = [
    "-Dman-pages=disabled"
  ];

  fixupPhase = ''
    install -m755 ${script} $out/bin/$pname.sh
    substituteInPlace $out/bin/$pname.sh \
      --replace $pname $out/bin/$pname \
      --replace '#!/bin/bash' '#!${lib.getExe pkgs.bash}'
  '';

  meta = {
    description = "xtmapper wrapper for waydroid";
    homepage = "https://github.com/Xtr126/cage-xtmapper";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "cage_xtmapper.sh";
    platforms = lib.platforms.all;
  };
})
