{ pkgs, lib, ... }: let
  buildFirefoxXpiAddon = import ./buildFirefoxXpiAddon.nix { inherit pkgs lib; };
in {
  what-font = buildFirefoxXpiAddon {
    pname = "zjm-whatfont";
    version = "1.3";
    addonId = "{dcb8caa2-63fa-41aa-a508-a45c5990ebdd}";
    url = "https://addons.mozilla.org/firefox/downloads/file/1748637/zjm_whatfont-1.3.xpi";
    sha256 = "f3ded17571aafc3ab32f102be24d6397712336bfc52584492f3a07b85652e266";
    meta = {
      homepage = "https://github.com/chengyin/WhatFont-Bookmarklet";
      mozPermissions = [
        "activeTab"
        "*://chengyinliu.com/*"
        "*://typekit.com/*"
        "*://www.google.com/webfonts/*"
        "http://fontdeck.com/"
        "<all_urls>"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  wakatime = buildFirefoxXpiAddon {
    pname = "wakatimes";
    version = "4.1.0";
    addonId = "addons@wakatime.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4491651/wakatimes-4.1.0.xpi";
    sha256 = "8bcbe94e36612a1cd2cfcce25e941aa20f4ea75382f8663474d1efc9f75a18e9";
    meta = {
      homepage = "https://wakatime.com";
      mozPermissions = [
        "alarms"
        "tabs"
        "storage"
        "activeTab"
        "https://api.wakatime.com/*"
        "https://wakatime.com/*"
        "devtools"
        "<all_urls>"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  stayfree = buildFirefoxXpiAddon {
    pname = "stayfree";
    version = "2.4.1";
    addonId = "{30b15d56-b2fa-4cb2-98fd-7b5e26306483}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4570458/stayfree-2.4.1.xpi";
    sha256 = "12b1b892a218701eb5b1e0083ae0eacf8c37ab484c473dd0473b1c2d3023996b";
    meta = {
      homepage = "https://stayfreeapps.com/";
      mozPermissions = [
        "alarms"
        "tabs"
        "storage"
        "notifications"
        "webNavigation"
        "scripting"
        "favicon"
        "search"
        "https://www.google.com/s2/favicons"
        "https://*.gstatic.com/favicon*"
        "*://*.stayfreeapps.com/*"
        "*://*/*"
        "*://*.facebook.com/*"
        "*://*.instagram.com/*"
        "*://*.snapchat.com/*"
        "*://*.tiktok.com/*"
        "*://*.x.com/*"
        "*://*.youtube.com/*"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  firefox-relay = buildFirefoxXpiAddon {
    pname = "firefox-relay";
    version = "2.8.1";
    addonId = "private-relay@firefox.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4205650/private_relay-2.8.1.xpi";
    sha256 = "4a85ddc1cd19d2a156c4efe76225d424c0c32e700ab77601f8c1e50d7975cd9d";
    meta = {
      homepage = "https://relay.firefox.com/";
      mozPermissions = [
        "<all_urls>"
        "storage"
        "menus"
        "contextMenus"
        "https://relay.firefox.com/"
        "https://relay.firefox.com/**"
        "https://relay.firefox.com/accounts/profile/**"
        "https://relay.firefox.com/accounts/settings/**"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  preact-devtools = buildFirefoxXpiAddon {
    pname = "preact-devtools";
    version = "6.1.1";
    addonId = "@react-devtools";
    url = "https://addons.mozilla.org/firefox/downloads/file/4432990/react_devtools-6.1.1.xpi";
    sha256 = "b2d69e220402bd6b8bc7d833948915b1d6dcabb453a1d50872a3db860fd92c46";
    meta = {
      homepage = "https://github.com/facebook/react";
      mozPermissions = [
        "scripting"
        "storage"
        "tabs"
        "clipboardWrite"
        "devtools"
        "<all_urls>"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  allow-right-click = buildFirefoxXpiAddon {
    pname = "allow-right-click";
    version = "0.6.6";
    addonId = "{278b0ae0-da9d-4cc6-be81-5aa7f3202672}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4555366/re_enable_right_click-0.6.6.xpi";
    sha256 = "49263636914d03aad975453667caee0f61a7339e27a7d63edc67f4bf7f88efcb";
    meta = {
      homepage = "https://webextension.org/listing/allow-right-click.html";
      mozPermissions = [
        "storage"
        "activeTab"
        "scripting"
        "contextMenus"
        "notifications"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  firefoxpwa = buildFirefoxXpiAddon {
    pname = "firefoxpwa";
    version = "2.15.0";
    addonId = "firefoxpwa@filips.si";
    url = "https://addons.mozilla.org/firefox/downloads/file/4537285/pwas_for_firefox-2.15.0.xpi";
    sha256 = "75dda1bfd5b4737210c7bec1949de939e1c8f3f5d0ac4f196c0d8fd24d9657ce";
    meta = {
      homepage = "https://github.com/filips123/PWAsForFirefox";
      mozPermissions = [
        "http://*/*"
        "https://*/*"
        "nativeMessaging"
        "notifications"
        "storage"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  xdm = buildFirefoxXpiAddon {
    pname = "xdm-integration-module";
    version = "1.3";
    addonId = "xdm-integration-module@subhra74.github.io";
    url = "https://addons.mozilla.org/firefox/downloads/file/4044567/xdm_integration_module-1.3.xpi";
    sha256 = "cdd93f9e979a82ae2f4cf1ec165408fb2aaf575962d7a41a2fbacb4624432b6e";
    meta = {
      homepage = "https://github.com/subhra74/xdm";
      mozPermissions = [
        "downloads"
        "tabs"
        "nativeMessaging"
        "cookies"
        "webRequest"
        "*://*/*"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  xdm_v8 = buildFirefoxXpiAddon {
    pname = "xdm-browser-monitor-v8";
    version = "3.4";
    addonId = "xdm-v8-browser-helper@subhra74.github.io";
    url = "https://addons.mozilla.org/firefox/downloads/file/4095144/xdm_browser_monitor_v8-3.4.xpi";
    sha256 = "fb703ac17dc239600389a86953fbf63df6d31280a7745147c11cba932d1657c9";
    meta = {
      homepage = "";
      mozPermissions = [
        "tabs"
        "cookies"
        "contextMenus"
        "menus"
        "activeTab"
        "webRequest"
        "webRequestBlocking"
        "*://*/*"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
}
