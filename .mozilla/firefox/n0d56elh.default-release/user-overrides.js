// My overrides for Arkenfox's user.js

// Use the user js parrot pref to report if there's a syntax error
// with the overrides section
user_pref("_user.js.parrot", "ERROR: Overrides section syntax error");

// Enable autoscrolling.
// This is scrolling mode activated by the middle click button.
user_pref("general.autoScroll", true);

// Stop firefox from asking to save passwords.
// I have Bitwarden to do this.
user_pref("signon.rememberSignons", false);

// Disable capturing credentials in private browsing mode.
// I have Bitwarden to do this.
user_pref("signon.privateBrowsingCapture.enabled", false);

// Disable the credit card and address manager.
// I have Bitwarden to do this.
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// Enable session restore
user_pref("browser.startup.page", 3);

// Get firefox to save new files automatically instead of asking
user_pref("browser.download.always_ask_before_handling_new_types", false);

// Remove everything on the new tab page so that it looks clean.
// This actually doesn't matter since I use Vimium C's new tab adapter
// which already makes the page a blank page.

// Remove shortcuts
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// Remove sponsored shortcuts
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Remove recommended by Pocket
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Remove sponsored Stories
user_pref("browser.newtabpage.activity-stream.showSponsored", false);

// Disable sending to Pocket on the new tab page,
// not that it really matters since the new tab page is already clean.
user_pref(
  "browser.newtabpage.activity-stream.discoverystream.sendToPocket.enabled",
  false
);
user_pref(
  "browser.newtabpage.activity-stream.discoverystream.saveToPocketCard.enabled",
  false
);

// Allow the creation of custom search engines.
// Secret pref.
user_pref("browser.urlbar.update2.engineAliasRefresh", true);

// Disable Pocket entirely
user_pref("extensions.pocket.enabled", false);

// Don't allow websites to prompt for the notification permission
user_pref("permissions.default.desktop-notification", 2);

// Disable notifications completely
user_pref("dom.webnotifications.enabled", false);
user_pref("dom.push.enabled", false);
user_pref("dom.push.connection.enabled", false);

// Don't allow websites to prompt for the virtual reality permission
user_pref("permissions.default.xr", 2);

// Disable virtual reality completely
user_pref("dom.vr.enabled", false);
user_pref("dom.vr.process.enabled", false);
user_pref("dom.vr.oculus.enabled", false);
user_pref("dom.vr.oculus.invisible.enabled", false);
user_pref("dom.vr.openvr.enabled", false);
user_pref("dom.vr.osvr.enabled", false);
user_pref("dom.vr.puppet.enabled", false);

// Disable privacy preserving ad measurement
user_pref("dom.private-attribution.submission.enabled", false);

// Show the user suggestions page when there is a error in HTTPS-only mode
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// Stop the pop-up to add applications for mailto: links
user_pref("network.protocol-handler.external.mailto", false);

// Set Quad9 as the DNS provider
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");

// Force DNS over HTTPS (DoH)
user_pref("network.trr.mode", 3);
user_pref("network.dns.skipTRR-when-parental-control-enabled", false);

// Don't clear history on shutdown
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false);

// Resist fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Enable letter boxing,
// which are the borders on the sides of the window to fake screen size
user_pref("privacy.resistFingerprinting.letterboxing", true);

// Exempt Telegram web from resist fingerprinting
user_pref("privacy.resistFingerprinting.exemptedDomains", "web.telegram.org");

// Spoof the language so that my Firefox locale doesn't match my OS locale
user_pref("privacy.spoof_english", 2);

// Disable WebGL
user_pref("webgl.disabled", true);

// Disable DRM
user_pref("media.eme.enabled", false);

// Disable the prompt to enable DRM
user_pref("browser.eme.ui.enabled", false);

// Use the user js parrot pref to report if the overrides section is successful.
// The message used here is the default one used in the Arkenfox user js.
user_pref(
  "_user.js.parrot",
  "SUCCESS: No no he's not dead, he's, he's restin'!"
);
