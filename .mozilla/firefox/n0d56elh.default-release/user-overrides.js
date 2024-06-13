// My overrides for Arkenfox's user.js

// Enable session restore
user_pref("browser.startup.page", 3);

// Get firefox to save new files automatically instead of asking
user_pref("browser.download.always_ask_before_handling_new_types", false);

// Enable autoscrolling
// This is scrolling mode activated by the middle click button
user_pref("general.autoScroll", true);

// Stop firefox from asking to save passwords
// I have Bitwarden to do this
user_pref("signon.rememberSignons", false);

// Disable capturing credentials in private browsing mode
// I have Bitwarden to do this
user_pref("signon.privateBrowsingCapture.enabled", false);

// Disable the credit card and address manager
// I have Bitwarden to do this
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// Remove everything on the new tab page so that it looks clean
// This actually doesn't matter since I use Vimium C's new tab adapter
// Which already makes the page a blank page
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);              // Shortcuts
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);       // Sponsored shortcuts
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);    // Recommended by Pocket
user_pref("browser.newtabpage.activity-stream.showSponsored", false);               // Sponsored Stories

// Disable sending to pocket on the new tab page
// Not that it really matters since the new tab page is already clean
user_pref("browser.newtabpage.activity-stream.discoverystream.sendToPocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.saveToPocketCard.enabled", false);

// Disable pocket entirely
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

// Stop the pop-up to add applications for mailto: links
user_pref("network.protocol-handler.external.mailto", false);

// Set Quad9 as the DNS provider
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");

// Force DNS over HTTPS (DoH)
user_pref("network.trr.mode", 3);
user_pref("network.dns.skipTRR-when-parental-control-enabled", false);

// Show the user suggestions page when there is a error in HTTPS-only mode
user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

// Don't clear history on shutdown
user_pref("privacy.clearOnShutdown.history", false);

// Allow the creation of custom search engines
// Secret pref
user_pref("browser.urlbar.update2.engineAliasRefresh", true);

// Resist fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Enable letter boxing (the borders on the sides of the window to fake screen size)
user_pref("privacy.resistFingerprinting.letterboxing", true);

// Disable WebGL
user_pref("webgl.disabled", true);

// Spoof the language so that my Firefox locale doesn't match my OS locale
user_pref("privacy.spoof_english", 2);

// Exempt Telegram web from resist fingerprinting
user_pref("privacy.resistFingerprinting.exemptedDomains", "web.telegram.org");
