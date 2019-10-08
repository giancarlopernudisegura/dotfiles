// Copyright (c) 2017 Haggai Nuchi
// Available for use under the MIT License:
// https://opensource.org/licenses/MIT

// Set "useLionFullScreen" in the same way that it's done in
// chrome://browser/content/browser-fullScreenAndPointerLock.js
XPCOMUtils.defineLazyGetter(FullScreen, "useLionFullScreen", function () {
    return false;
});

// ==UserScript==
// @name                 Custom New Tab
// @version              1.0
// @description          Load a custom link or local file, instead of the default new tab page (about:newtab).
// @author               https://www.reddit.com/user/Luke-Baker/
// @license              https://creativecommons.org/licenses/by-sa/4.0/
// @compatibility        Created 2018-01-15. Tested on Firefox 59.
// ==/UserScript==
(function () {

    // IMPORTANT: when there's no filename, be sure to include a trailing slash at the end.
    // const mypage = "about:newtab";
    const mypage = "file:////home/giancarlo/.mozilla/firefox/r2n4znb9.default-nightly/chrome/home.html";
    // Don't place the caret in the location bar. Useful if you want a page's search box to have focus instead.
    var removefocus = "no";
    // Clear the page's URL from the location bar. Normally not needed, as this should already be the default behavior.
    var clearlocationbar = "no";

    aboutNewTabService.newTabURL = mypage;
    function customNewTab() {
        if (removefocus == "yes") {
            setTimeout(function () {
                gBrowser.selectedBrowser.focus();
            }, 0);
        }
        if (clearlocationbar == "yes") {
            setTimeout(function () {
                if (gBrowser.selectedBrowser.currentURI.spec == mypage) {
                    window.document.getElementById("urlbar").value = "";
                }
            }, 1000);
        }
    }
    gBrowser.tabContainer.addEventListener("TabOpen", customNewTab, false);

}());
