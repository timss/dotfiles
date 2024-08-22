// Enable userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.download.panel.shown", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
user_pref("extensions.pocket.enabled", false);
user_pref("general.autoScroll", true);
user_pref("general.smoothScroll", false);
user_pref("general.smoothScroll.mouseWheel.migrationPercent", 0);
user_pref("middlemouse.paste", false);

// 24h instead of 12h AM/PM
// user_pref("intl.accept_languages", "nb,en-us,en");

// Restart last session
user_pref("browser.startup.page", 3);

// Disable spell checking
user_pref("layout.spellcheckDefault", 0);

// Affects new windows that instead were diverted to a new tab
user_pref("browser.tabs.loadDivertedInBackground", false);

// Disable backspace as back button (default)
user_pref("browser.backspace_action", 2);

// https://news.ycombinator.com/item?id=41311479
// Introduced in Firefox version 128
user_pref("dom.private-attribution.submission.enabled", false);
