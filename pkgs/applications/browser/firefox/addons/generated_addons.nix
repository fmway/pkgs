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
    version = "2.3.0";
    addonId = "{30b15d56-b2fa-4cb2-98fd-7b5e26306483}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4538767/stayfree-2.3.0.xpi";
    sha256 = "ce9692daf4ff0009023cb13cf5e08a1dcd2cd2f2d0b8b5e87b810e53216a2633";
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
    version = "7.7.7";
    addonId = "{5caff8cc-3d2e-4110-a88a-003cc85b3858}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4508409/vue_js_devtools-7.7.7.xpi";
    sha256 = "5672cd0d3298fa57f2f51e4644011e4152e6e291f6f338601495dd8037331169";
    meta = {
      homepage = "https://devtools.vuejs.org";
      mozPermissions = [
        "<all_urls>"
        "devtools"
      ];
      # todo
      licenses = with lib.licenses; [];
      platforms = lib.platforms.all;
    };
  };
  allow-right-click = buildFirefoxXpiAddon {
    pname = "allow-right-click";
    version = "0.6.3";
    addonId = "{278b0ae0-da9d-4cc6-be81-5aa7f3202672}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4418703/re_enable_right_click-0.6.3.xpi";
    sha256 = "4abf7e5fa49424c6e69fe12fb357f616763f852e7c00bb14ac0c5c46d201e663";
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
