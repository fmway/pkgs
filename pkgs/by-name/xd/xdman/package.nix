{ lib
, fetchFromGitHub
, buildDotnetModule
, gtk3
, ffmpeg-full
, dotnetCorePackages
, makeDesktopItem
, copyDesktopItems
, wrapGAppsHook3
, ... }:
buildDotnetModule rec {
  pname = "xdman";
  version = "8.0.29";

  src = fetchFromGitHub {
    owner = "subhra74";
    repo = "xdm";
    rev = version;
    hash = "sha256-bdDiTwqsid+I2rsEYqcEOpvL9W3CwgAY0D1R837smdg=";
  };

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = dotnetCorePackages.runtime_6_0;

  projectFile = "./app/XDM/XDM.Gtk.UI/XDM.Gtk.UI.csproj";
  
  runtimeDeps = [
    gtk3
    ffmpeg-full
  ];

  nativeBuildInputs = [
    copyDesktopItems
    wrapGAppsHook3
  ];

  desktopItems = [
    (makeDesktopItem rec {
      name = "Xtreme Download Manager";
      desktopName = name;
      comment = meta.description;
      exec = pname;
      icon = "xdm-app";
      categories = [ "Utility" ];
      keywords = [ "download" "internet" "manager" ];
      startupWMClass = "xdm-app";
      startupNotify = false;
    })
  ];

  fixupPhase = ''
    install -m 755 $out/bin/xdm-app $out/bin/${pname}
    mkdir -p $out/bin $out/share/icons/hicolor/512x512/apps/ $out/share/icons/hicolor/scalable/apps $out/share/${pname}/chrome-extension
    install -m 644 $out/lib/${pname}/xdm-logo-512.png $out/share/icons/hicolor/512x512/apps/xdm-logo.png
    install -m 644 $out/lib/${pname}/xdm-logo-512.png $out/share/icons/hicolor/512x512/apps/xdm-app.png
    install -m 644 $out/lib/${pname}/xdm-logo.svg $out/share/icons/hicolor/scalable/apps/xdm-logo.svg
    install -m 644 $out/lib/${pname}/xdm-logo.svg $out/share/icons/hicolor/scalable/apps/xdm-app.svg

    cp $out/lib/${pname}/chrome-extension/* $out/share/${pname}/chrome-extension/
  '';

  nugetDeps = ./deps.json;

  meta = with lib; {
    description = "Powerful download accelerator and video downloader";
    homepage = "https://github.com/subhra74/xdm";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "xdman";
    platforms = platforms.all;
  };

  executables = [ "xdm-app" ];
}
