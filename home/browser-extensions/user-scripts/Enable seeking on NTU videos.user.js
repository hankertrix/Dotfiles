// ==UserScript==
// @name         Enable seeking on NTU videos
// @version      0.1
// @description  Allow seeking on NTU websites that stop the user from seeking using the seek bar.
// @author       Hankertrix
// @match        https://contentweb.ntu.edu.sg/*
// @match        https://ntulearn.ntu.edu.sg/courses/*/index_lms.html
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Create an observer to watch for changes to the page
    const observer = new MutationObserver(() => {

        // Tries to get the seek bar element
        const seekBar = document.getElementById("seek");

        // If the seek bar element is found, remove the "read-only" class from it
        if (seekBar) {
          seekBar.classList.remove("read-only");
        }
    });

    // Gets the observer to observe the document body for changes
    observer.observe(document.body, {
        childList: true,
        subtree: true
    });
})();