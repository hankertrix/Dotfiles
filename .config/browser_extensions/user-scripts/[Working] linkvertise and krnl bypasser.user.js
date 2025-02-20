// ==UserScript==
// @name         [Working] linkvertise and krnl bypasser
// @namespace    bypass-city
// @homepageURL  https://bypass.city
// @supportURL   https://discord.gg/bypass-city
// @description  just waits 15 seconds for krnl and works fine with the other stuff 2 (it waits no time for other stuff) :)
// @match        *://*.adshnk.com/*
// @match        *://*.adshrink.it/*
// @match        *://*.shrink-service.it/*
// @match        *://adfoc.us/*
// @match        *://boost.ink/*
// @match        *://bst.gg/*
// @match        *://bst.wtf/*
// @match        *://booo.st/*
// @match        *://boost.fusedgt.com/*
// @match        *://thedragonslayer2.github.io/*
// @match        *://empebau.eu/*
// @match        *://www.google.com/url*
// @match        *://is.gd/*
// @match        *://justpaste.it/redirect/*
// @match        *://leasurepartment.xyz/*
// @match        *://letsboost.net/*
// @match        *://linkvertise.com/*
// @match        *://loot-link.com/*
// @match        *://loot-link.co/*
// @match        *://loot-link.org/*
// @match        *://loot-link.net/*
// @match        *://loot-link.info/*
// @match        *://loot-links.com/*
// @match        *://loot-links.co/*
// @match        *://loot-links.org/*
// @match        *://loot-links.net/*
// @match        *://loot-links.info/*
// @match        *://lootlinks.com/*
// @match        *://lootlinks.co/*
// @match        *://lootlinks.org/*
// @match        *://lootlinks.net/*
// @match        *://lootlinks.info/*
// @match        *://lootdest.com/*
// @match        *://lootdest.co/*
// @match        *://lootdest.org/*
// @match        *://lootdest.net/*
// @match        *://lootdest.info/*
// @match        *://links-loot.com/*
// @match        *://links-loot.co/*
// @match        *://links-loot.org/*
// @match        *://links-loot.net/*
// @match        *://links-loot.info/*
// @match        *://linksloot.com/*
// @match        *://linksloot.co/*
// @match        *://linksloot.org/*
// @match        *://linksloot.net/*
// @match        *://linksloot.info/*
// @match        *://lootlink.com/*
// @match        *://lootlink.co/*
// @match        *://lootlink.org/*
// @match        *://lootlink.net/*
// @match        *://lootlink.info/*
// @match        *://mboost.me/*
// @match        *://rekonise.com/*
// @match        *://rkns.link/*
// @match        *://shorte.st/*
// @match        *://sh.st/*
// @match        *://gestyy.com/*
// @match        *://destyy.com/*
// @match        *://social-unlock.com/*
// @match        *://socialwolvez.com/app/l/*
// @match        *://sub1s.com/*
// @match        *://sub2get.com/*
// @match        *://subtolink.com/*
// @match        *://sub2unlock.com/*
// @match        *://unlocknow.net/*
// @match        *://v.gd/*
// @match        https://bypass.city/*
// @match        https://adbypass.org/*
// @match        http://localhost:3000/*
// @license      CC BY-NC 4.0 (https://creativecommons.org/licenses/by-nc/4.0/).
// @exclude      *://publisher.linkvertise.com/*
// @exclude      *://linkvertise.com/adfly-notice*
// @exclude      *://linkvertise.com/search*
// @exclude      *://linkvertise.com/login*
// @exclude      *://linkvertise.com/profile*
// @exclude      *://blog.linkvertise.com
// @exclude      *://blog.linkvertise.com/*
// @exclude      *://linkvertise.com/assets/vendor/*
// @exclude      *://publisher.linkvertise.com/*
// @exclude      *://link-mutation.linkvertise.com/*
// @exclude      *://linkvertise.com/assets/external/thinksuggest
// @downloadURL  https://api2.adbypass.org/userscript/download/bypass.user.js
// @updateURL    https://api2.adbypass.org/userscript/download/bypass.meta.js

// @grant        GM_getValue
// @grant        GM.getValue

// @grant        GM_setValue
// @grant        GM.setValue

// @grant        GM_deleteValue
// @grant        GM.deleteValue

// @grant        GM_addStyle
// @grant        GM.addStyle

// @grant        GM_xmlhttpRequest
// @grant        GM.xmlHttpRequest

// @grant        GM.info
// @grant        GM_info

// @grant        GM_getResourceURL
// @grant        GM.getResourceURL



// @version      14.0.2
// @releaseDate  2025-01-29T20:49:59.572Z
// @author       bypass.city team
// @connect      bypass.city
// @connect      adbypass.org
// @icon         https://adbypass.org/favicon.ico

// ==/UserScript==
/*
release: 14.0.2 (1182f49), 1/29/2025, 8:49:59 PM
Discord: https://discord.gg/bypass-city
additional copyright/license info:
Linkvertise Bypass by "bypass.city team" is licensed under CC BY-NC 4.0 (https://creativecommons.org/licenses/by-nc/4.0/).

Linkvertise Bypass © 2025 by bypass.city team.

Please Leave this section here if you plan on re-posting this script.
If you plan on re-posting this script to GreasyFork then go to the admin
tab and under source syncing put
this URL to always have the latest version: https://api2.adbypass.org/userscript/download/bypass.user.js
*/

(() => {
  // src/polyfills.ts
  var UserScript = {
    getValue: (key, defaultValue) => {
      return typeof GM_getValue == "undefined" ? GM.getValue(key, defaultValue) : new Promise((resolve) => resolve(GM_getValue(key, defaultValue)));
    },
    setValue: (key, value) => {
      return typeof GM_setValue === "undefined" ? GM.setValue(key, value) : new Promise((resolve) => resolve(GM_setValue(key, value)));
    },
    deleteValue: (key) => {
      return typeof GM_deleteValue === "undefined" ? GM.deleteValue(key) : new Promise((resolve) => resolve(GM_deleteValue(key)));
    },
    addStyle: (css) => {
      return typeof GM_addStyle === "undefined" ? GM.addStyle(css) : new Promise((resolve) => resolve(GM_addStyle(css)));
    },
    xmlHttpRequest: (details) => {
      return typeof GM_xmlhttpRequest === "undefined" ? GM.xmlHttpRequest(details) : GM_xmlhttpRequest(details);
    },
    getResourceURL: (name, fallbackUrl) => {
      return typeof GM_getResourceURL !== "undefined" ? new Promise((resolve) => resolve(GM_getResourceURL(name))) : typeof GM.getResourceUrl !== "undefined" ? GM.getResourceUrl(name) : new Promise((resolve) => resolve(fallbackUrl));
    },
    info: typeof GM_info === "undefined" ? GM.info : GM_info
  };

  // src/config.ts
  var config = {
    version: UserScript.info.script.version,
    buildTime: "1/29/2025, 8:49:59 PM",
    branch: "release",
    release: "1182f49",
    installed: true,
    releaseTag: "14.0.2 (1182f49)",
    downloadURL: GM_info.script.downloadURL
  };

  // src/gmWrappedStorage.ts
  var WrappedGet = async (key) => {
    const value = await UserScript.getValue(key);
    return value ? JSON.parse(value) : void 0;
  };
  var WrappedSet = async (key, value) => {
    await UserScript.setValue(key, JSON.stringify(value));
  };

  // src/utils.ts
  var sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

  // src/bypass-city.ts
  var bypassCityListener = async () => {
    if (window.location.hostname !== "bypass.city" && window.location.hostname !== "localhost" && window.location.hostname !== "adbypass.org") {
      return;
    }
    injectScriptInfo();
    sendUserscriptInfoEvent();
    window.addEventListener("bypassComplete", async (event) => {
      const data = event.detail;
      const redirectURL = await UserScript.getValue("bypass.callback");
      console.log("bypassMessage", data);
      await UserScript.deleteValue("bypass.data");
      await UserScript.deleteValue("bypass.callback");
      await sleep(1);
      WrappedSet("bypass.data", data);
      window.open(redirectURL, "_self", "noopener,noreferrer");
      await sleep(200);
      window.open(redirectURL, "_blank");
    });
  };
  var injectScriptInfo = () => {
    const injectJs = `window.scriptInfo = JSON.parse('${JSON.stringify(config)}')`;
    const script = document.createElement("script");
    script.textContent = injectJs;
    document.body.appendChild(script);
  };
  var sendUserscriptInfoEvent = () => {
    const event = new CustomEvent("userScriptInfo", {
      detail: config
    });
    window.dispatchEvent(event);
  };

  // src/notify.scss
  var notify_default = `.notification-tray {
  position: fixed;
  top: 10px;
  right: 10px;
  z-index: 4000000;
}

.notification {
  position: block;
  margin: 10px;
  padding: 10px;
  padding-right: 20px;
  background-color: #25262b;
  color: white;
  transition: opacity 0.6s; /* 600ms to fade out */
  width: 300px;
  border-radius: 10px; /* Rounded border */
  border: 2px solid #3b5bdb;
  animation: glow 1s ease-in-out infinite alternate;
}

.notification .grid-container {
  display: grid;
  grid-template-columns: auto auto;
  gap: 10px;
}

.notification .links {
  display: flex;
  justify-content: right;
  align-items: center;
}

.notification .links span {
  padding-bottom: 4px;
  opacity: 0.7;
}

.notification .links a, .notification .links span {
  display: block;
  color: white;
  font-size: 0.8rem;
  padding: 5px;
  margin-bottom: 5px;
}

.grid-item img {
  margin-top: 15px;
  margin-right: 5px;
  width: 32px;
}

.grid-item h3 {
  padding-top: 10px;
  padding-bottom: 3px;
  font-size: 1.5rem;
  color: white;
}

.grid-item p {
  font-style: italic;
  font-size: 1rem;
  color: white;
}
.grid-item p a {
  opacity: 1;
  font-weight: 600;
  text-decoration: underline !important;
  margin-bottom: 8px;
  display: inline-block;
}

.grid-item h3, .grid-item p {
  margin: 0;
}

@keyframes glow {
  from {
    box-shadow: 0 0 10px #3b5bdb;
  }
  to {
    box-shadow: 0 0 20px #3b5bdb;
  }
}`;

  // src/notify-element.html
  var notify_element_default = '<div id="bypass-notification" class="notification">\n    <div class="grid-container">\n      <div class="grid-item">\n        <img height="32" id="bypass-logo" alt="B">\n      </div>\n      <div class="grid-item">\n        <h3 id="title"></h3>\n        <p>\n            <span id="text"></span>\n            <a id="help" href="https://discord.gg/tX8G9G5BMV">Get Support on our Discord</a>\n        </p>\n      </div>\n    </div>\n   \n      <div id="links" class="links">\n        <span id="version">Release</span>\n        <span>&#8226;</span>\n        <a  href="https://discord.gg/tX8G9G5BMV">Get Support</a>\n        <span>&#8226;</span>\n        <a href="https://bypass.city/privacy">Privacy Policy</a>\n      \n      </div>\n  </div>\n  ';

  // src/logo.svg
  var logo_default = 'data:image/svg+xml,<svg width="1280" height="1280" viewBox="0 0 1280 1280" fill="none" xmlns="http://www.w3.org/2000/svg">%0A<path d="M109 180C109 140.788 140.788 109 180 109H1101C1140.21 109 1172 140.788 1172 180V1101C1172 1140.21 1140.21 1172 1101 1172H180C140.788 1172 109 1140.21 109 1101V180Z" fill="%231A1B1E"/>%0A<path d="M611.881 198C1078.56 198 1078.56 733.341 611.881 733.341H407V198H611.881Z" fill="url(%23paint0_linear_1_4)"/>%0A<path d="M611.881 547.659C1078.56 547.659 1078.56 1083 611.881 1083H407V547.659H611.881Z" fill="%231971C2"/>%0A<defs>%0A<linearGradient id="paint0_linear_1_4" x1="684.443" y1="198" x2="684.443" y2="733.341" gradientUnits="userSpaceOnUse">%0A<stop stop-color="%235F3DC4"/>%0A<stop offset="1" stop-color="%235F3DC4" stop-opacity="0"/>%0A</linearGradient>%0A</defs>%0A</svg>%0A';

  // src/notify.ts
  window.scriptStatus = {
    notifyCount: 0
  };
  var BypassElement = class extends HTMLElement {
    static get observedAttributes() {
      return ["text", "title", "is-help"];
    }
    constructor() {
      super();
      const shadow = this.attachShadow({ mode: "open" });
      const div = document.createElement("div");
      div.innerHTML = notify_element_default;
      const style = document.createElement("style");
      style.textContent = notify_default;
      shadow.appendChild(style);
      shadow.appendChild(div);
      shadow.getElementById("bypass-notification").style.opacity = "0";
      shadow.getElementById("version").innerText = config.releaseTag;
      const logoImg = shadow.querySelector("img#bypass-logo");
      logoImg.onload = () => {
        shadow.getElementById("bypass-notification").style.opacity = "1";
      };
      logoImg.src = logo_default;
    }
    connectedCallback() {
      this.updateContent();
    }
    attributeChangedCallback(name, oldValue, newValue) {
      this.updateContent();
    }
    updateContent() {
      const text = this.getAttribute("text") || "";
      const title = this.getAttribute("title") || "";
      const isHelp = this.hasAttribute("is-help");
      const hideLinks = this.hasAttribute("hide-links");
      if (isHelp || hideLinks) {
        this.shadowRoot.getElementById("links").remove();
      }
      this.shadowRoot.getElementById("help").style.display = isHelp ? "block" : "none";
      this.shadowRoot.querySelector("#title").textContent = title;
      this.shadowRoot.querySelector("#text").textContent = text;
    }
  };
  customElements.define("bypass-notification", BypassElement);
  var setupNotifications = () => {
    const style = document.createElement("style");
    style.textContent = notify_default;
    document.head.appendChild(style);
    const tray = document.createElement("div");
    tray.id = "bypass-tray";
    tray.classList.add("notification-tray");
    document.body.appendChild(tray);
  };
  var notify = ({ text, title, isHelp, hideLinks }) => {
    if (!document.getElementById("bypass-tray")) {
      setupNotifications();
    }
    const titleContent = title || "Bypass in progress...";
    const textContent = text || "Please wait while we redirect you";
    const notificationElement = document.createElement("bypass-notification");
    notificationElement.setAttribute("title", titleContent);
    notificationElement.setAttribute("text", textContent);
    if (hideLinks) {
      notificationElement.setAttribute("hide-links", "true");
    }
    if (isHelp) {
      notificationElement.setAttribute("is-help", "true");
    }
    document.getElementById("bypass-tray").appendChild(notificationElement);
  };

  // src/fetch.ts
  var jsonFetch = async (url, options) => {
    return new Promise((resolve, reject) => {
      UserScript.xmlHttpRequest({
        method: options.method,
        data: options.data ? JSON.stringify(options.data) : void 0,
        headers: options.headers,
        url,
        onload: (response) => {
          if (response.responseText && typeof response.responseText === "string") {
            try {
              const data = JSON.parse(response.responseText);
              resolve(data);
            } catch (e) {
              reject();
            }
          } else {
            reject();
          }
        },
        onerror: reject,
        ontimeout: reject,
        onabort: reject,
        timeout: 5e3
      });
    });
  };

  // src/ping.ts
  var ping = async () => {
    try {
      const data = await jsonFetch(
        `${"https://bypass.city"}/.well-known/ping.json`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json"
          }
        }
      );
      return data.ping;
    } catch (e) {
      return false;
    }
  };

  // src/bypassConfig.ts
  var regexObjects = [
    {
      name: "adshrink",
      regex: /^https?:\/\/(www\.)?(adshnk\.com|adshrink\.it|shrink-service\.it)/i,
      userscript_regex: ["*://*.adshnk.com/*", "*://*.adshrink.it/*", "*://*.shrink-service.it/*"],
      valid_url_regex: /^https?:\/\/(www\.)?(adshnk\.com|adshrink\.it|shrink-service\.it)\/.+/,
      url_base: "https://adshnk.com"
    },
    {
      name: "adfocus",
      regex: /^https?:\/\/adfoc\.us/i,
      userscript_regex: "*://adfoc.us/*",
      valid_url_regex: /^https?:\/\/adfoc\.us\/(?:\d+|serve\/\?id=\d+)$/,
      url_base: "https://adfoc.us"
    },
    // {
    //     name: "bitly",
    //     regex: /^https?:\/\/bit\.ly/i,
    //     userscript_regex: "*://bit.ly/*",
    //     valid_url_regex: /^https?:\/\/bit\.ly\/.+/,
    //     url_base: "https://bit.ly"
    // },
    {
      name: "boost.ink",
      regex: /^https?:\/\/(boost\.ink|bst\.gg|bst\.wtf|booo\.st)/i,
      userscript_regex: [
        "*://boost.ink/*",
        "*://bst.gg/*",
        "*://bst.wtf/*",
        "*://booo.st/*"
      ],
      valid_url_regex: /^https?:\/\/(boost\.ink|bst\.gg|bst\.wtf|booo\.st)\/[a-zA-Z0-9_]+\/?$/,
      url_base: "https://boost.ink"
    },
    {
      name: "boost.fusedgt",
      regex: /^https?:\/\/boost\.fusedgt\.com/i,
      userscript_regex: "*://boost.fusedgt.com/*",
      valid_url_regex: /^https?:\/\/boost\.fusedgt\.com\/.+/,
      url_base: "https://boost.fusedgt.com"
    },
    // {
    //     name: "bstlar",
    //     regex: /^https?:\/\/bstlar\.com/i,
    //     userscript_regex: "*://bstlar.com/*",
    //     valid_url_regex: /^https?:\/\/bstlar\.com\/[a-zA-Z0-9-_]+\/[a-zA-Z0-9-_]+(?:\/|\?.*)?$/,
    //     url_base: "https://bstlar.com"
    // },
    {
      name: "dragonslayer",
      regex: /^(https?:\/\/)?thedragonslayer2\.github\.io\/.*$/i,
      userscript_regex: "*://thedragonslayer2.github.io/*",
      valid_url_regex: /^https?:\/\/thedragonslayer2\.github\.io\/GetKey\.html\?\w+$/,
      url_base: "https://thedragonslayer2.github.io"
    },
    {
      name: "empebau",
      regex: /^https?:\/\/empebau\.eu/i,
      userscript_regex: "*://empebau.eu/*",
      valid_url_regex: /^https?:\/\/empebau\.eu\/s\/(linker\/)?[a-zA-Z0-9-]+$/,
      url_base: "https://empebau.eu"
    },
    {
      name: "google_url",
      regex: /https?:\/\/www\.google\.com\/url/,
      userscript_regex: "*://www.google.com/url*",
      valid_url_regex: /https?:\/\/www\.google\.com\/url.+/,
      url_base: "https://www.google.com/url"
    },
    {
      name: "is.gd",
      regex: /^https?:\/\/is\.gd/i,
      userscript_regex: "*://is.gd/*",
      valid_url_regex: /^https?:\/\/is\.gd\/[a-zA-Z0-9-_]+$/,
      url_base: "https://is.gd"
    },
    {
      name: "justpaste",
      regex: /https?:\/\/justpaste\.it\/redirect\/[0-9a-z]+\//gm,
      userscript_regex: "*://justpaste.it/redirect/*",
      valid_url_regex: /https?:\/\/justpaste\.it\/redirect\/[0-9a-z]+\//,
      url_base: "https://justpaste.it"
    },
    {
      name: "leasurepartment",
      regex: /^(https?:\/\/)?leasurepartment\.xyz\/.*$/i,
      userscript_regex: "*://leasurepartment.xyz/*",
      valid_url_regex: /^https?:\/\/leasurepartment\.xyz\/\?h=[^&]+&tid=\d+&cc=[^&]+$/,
      url_base: "https://leasurepartment.xyz"
    },
    {
      name: "letsboost",
      regex: /^https?:\/\/letsboost\.net/i,
      userscript_regex: "*://letsboost.net/*",
      valid_url_regex: /^https?:\/\/letsboost\.net\/[a-zA-Z0-9-_]+$/,
      url_base: "https://letsboost.net"
    },
    {
      name: "linkvertise",
      regex: /^https?:\/\/(linkvertise\.(com|download)|(adf\.ly)|(link-(center|target|hub|to)|direct-link|file-link|link-target)\.net)/i,
      userscript_regex: "*://linkvertise.com/*",
      valid_url_regex: /^(https?:\/\/(?:www\.)?(linkvertise\.com|linkvertise\.net|link-to\.net)\/(?!$|search|login|profile|assets\/vendor\/|assets\/external\/thinksuggest|publisher|link-mutation|blog)(.*))$/i,
      url_base: "https://linkvertise.com"
    },
    {
      name: "loot-link",
      regex: /^https:\/\/(?:loot-link|loot-links|lootlinks|lootdest|links-loot|linksloot|lootlink)\.(?:com|co|org|net|info)\/s\?./i,
      userscript_regex: [
        "*://loot-link.com/*",
        "*://loot-link.co/*",
        "*://loot-link.org/*",
        "*://loot-link.net/*",
        "*://loot-link.info/*",
        "*://loot-links.com/*",
        "*://loot-links.co/*",
        "*://loot-links.org/*",
        "*://loot-links.net/*",
        "*://loot-links.info/*",
        "*://lootlinks.com/*",
        "*://lootlinks.co/*",
        "*://lootlinks.org/*",
        "*://lootlinks.net/*",
        "*://lootlinks.info/*",
        "*://lootdest.com/*",
        "*://lootdest.co/*",
        "*://lootdest.org/*",
        "*://lootdest.net/*",
        "*://lootdest.info/*",
        "*://links-loot.com/*",
        "*://links-loot.co/*",
        "*://links-loot.org/*",
        "*://links-loot.net/*",
        "*://links-loot.info/*",
        "*://linksloot.com/*",
        "*://linksloot.co/*",
        "*://linksloot.org/*",
        "*://linksloot.net/*",
        "*://linksloot.info/*",
        "*://lootlink.com/*",
        "*://lootlink.co/*",
        "*://lootlink.org/*",
        "*://lootlink.net/*",
        "*://lootlink.info/*"
      ],
      valid_url_regex: /^https:\/\/(?:loot-link|loot-links|lootlinks|lootdest|links-loot|linksloot|lootlink)\.(?:com|co|org|net|info)\/s\?./,
      url_base: "https://loot-link.com"
    },
    {
      name: "mboost",
      regex: /^https?:\/\/mboost\.me/i,
      userscript_regex: "*://mboost.me/*",
      valid_url_regex: /^https?:\/\/mboost\.me\/a\/[a-zA-Z0-9-_]{3}$/,
      url_base: "https://mboost.me"
    },
    // {
    //     name: "rebrandly",
    //     regex: /^https?:\/\/rebrand\.ly/i,
    //     userscript_regex: "*://rebrand.ly/*",
    //     valid_url_regex: /^https?:\/\/rebrand\.ly\/.+/,
    //     url_base: "https://rebrand.ly"
    // },
    {
      name: "rekonise",
      regex: /^https?:\/\/(rekonise\.com|rkns\.link)/i,
      userscript_regex: [
        "*://rekonise.com/*",
        "*://rkns.link/*"
      ],
      valid_url_regex: /^https?:\/\/(rekonise\.com|rkns\.link)\/[a-zA-Z0-9-]+(?:#[a-zA-Z0-9-_]+)?$/,
      url_base: "https://rekonise.com"
    },
    {
      name: "shortest",
      regex: /^https?:\/\/(shorte\.st|sh\.st|gestyy\.com|destyy\.com)/i,
      userscript_regex: [
        "*://shorte.st/*",
        "*://sh.st/*",
        "*://gestyy.com/*",
        "*://destyy.com/*"
      ],
      valid_url_regex: /^https?:\/\/(shorte\.st|sh\.st|gestyy\.com|destyy\.com)\/[a-zA-Z0-9\/-]+(?:\?.*)?$/,
      url_base: "https://shorte.st"
    },
    {
      name: "social-unlock",
      regex: /^https?:\/\/social-unlock\.com/i,
      userscript_regex: "*://social-unlock.com/*",
      valid_url_regex: /^https?:\/\/social-unlock\.com\/[a-zA-Z0-9]+\/?$/,
      url_base: "https://social-unlock.com"
    },
    {
      name: "socialwolvez",
      regex: /^https?:\/\/socialwolvez\.com\/app\/l\//i,
      userscript_regex: "*://socialwolvez.com/app/l/*",
      valid_url_regex: /^https?:\/\/socialwolvez\.com\/app\/l\/[a-zA-Z0-9]+\/?(?:#.*)?$/,
      url_base: "https://socialwolvez.com"
    },
    {
      name: "sub1s",
      regex: /^https?:\/\/sub1s\.com\//i,
      userscript_regex: "*://sub1s.com/*",
      valid_url_regex: /^https?:\/\/sub1s\.com\/(l\/)?[a-zA-Z0-9-_]+\/?$/,
      url_base: "https://sub1s.com"
    },
    {
      name: "sub2get",
      regex: /^https?:\/\/(www\.)?sub2get\.com/i,
      userscript_regex: "*://sub2get.com/*",
      valid_url_regex: /^https?:\/\/(www\.)?sub2get\.com\/link(\.php)?\?(l|id)=\d+\/?(?:#.*)?$/,
      url_base: "https://sub2get.com"
    },
    {
      name: "subtolink",
      regex: /^https?:\/\/(www\.)?(subtolink|subfinal)\.com/i,
      userscript_regex: "*://subtolink.com/*",
      valid_url_regex: /^https?:\/\/(www\.)?(subtolink|subfinal)\.com\/.+/,
      url_base: "https://subtolink.com"
    },
    {
      name: "sub2unlock",
      regex: /https?:\/\/sub2unlock\.com/i,
      userscript_regex: "*://sub2unlock.com/*",
      valid_url_regex: /^https?:\/\/sub2unlock\.com\/[a-zA-Z0-9-_]+\/?$/,
      url_base: "https://sub2unlock.com"
    },
    // {
    //     name: "tinylink",
    //     regex: /^https?:\/\/tinylink\.onl/i,
    //     userscript_regex: "*://tinylink.onl/*",
    //     valid_url_regex: /^https?:\/\/tinylink\.onl\/.+/,
    //     url_base: "https://tinylink.onl"
    // },
    // {
    //     name: "tinyurl",
    //     regex: /^https?:\/\/tinyurl\.com\/\w*/i,
    //     userscript_regex: "*://tinyurl.com/*",
    //     valid_url_regex: /^https?:\/\/tinyurl\.com\/\w+/,
    //     url_base: "https://tinyurl.com"
    // },
    {
      name: "unlocknow",
      regex: /^https?:\/\/unlocknow\.net\/*/i,
      userscript_regex: "*://unlocknow.net/*",
      valid_url_regex: /^https?:\/\/unlocknow\.net\/.+/,
      url_base: "https://unlocknow.net"
    },
    {
      name: "v.gd",
      regex: /https?:\/\/v\.gd/i,
      userscript_regex: "*://v.gd/*",
      valid_url_regex: /^https?:\/\/v\.gd\/[a-zA-Z0-9-_]+\/?$/,
      url_base: "https://v.gd"
    }
  ];
  var linkConfig = regexObjects;

  // src/commonResolver.ts
  var linksListner = async () => {
    const matchData = match(window.location.href);
    console.log(matchData);
    if (!matchData.match)
      return;
    const bypassData = await WrappedGet("bypass.data");
    console.log(bypassData);
    console.log(matchData.valid_url.test(window.location.href));
    if (bypassData) {
      notify({});
      await sleep(3e3);
      const targetUrl = bypassData.bypassData;
      await UserScript.deleteValue("bypass.data");
      await sleep(1);
      window.open(targetUrl, "_self");
      await sleep(200);
      window.open(targetUrl, "_blank");
    } else if (matchData.valid_url.test(window.location.href)) {
      let redirectBase = "https://bypass.city";
      const isPing = await ping();
      if (!isPing) {
        redirectBase = "https://adbypass.org";
      }
      notify({});
      await sleep(2e3);
      await UserScript.deleteValue("bypass.data");
      await UserScript.deleteValue("bypass.callback");
      await UserScript.setValue("bypass.callback", matchData.base);
      const bypassCityUrl = new URL(`${redirectBase}/bypass`);
      bypassCityUrl.searchParams.set("bypass", window.location.href);
      bypassCityUrl.searchParams.set("userscript", "true");
      bypassCityUrl.searchParams.set("userscript-version", config.version);
      window.open(bypassCityUrl.href, "_self");
      await sleep(200);
      window.open(bypassCityUrl.href, "_blank");
    }
  };
  var match = (url) => {
    for (const regex of linkConfig) {
      if (regex.regex.test(url)) {
        return {
          match: true,
          name: regex.name,
          base: regex.url_base,
          valid_url: regex.valid_url_regex
        };
      }
    }
    return {
      match: false
    };
  };

  // src/main.ts
  (async () => {
    console.info("Linkvertise Userscript", config.version, window.location.href);
    await bypassCityListener();
    await linksListner();
  })();
})();