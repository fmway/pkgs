final: prev: {
  fmpkgs = final.lib.warn "Use pkgs.fmway instead" final.fmway;
  fmway = import ./pkgs/top-level {
    pkgs = prev;
  } // {
    mpv = final.mpv.override (o: {
      scripts = o.scripts or [] ++
        final.fmway.mpv-scripts.all;
    });
  };
}
