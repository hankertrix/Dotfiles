# Configuration files for browser extensions

## [`user-scripts` folder](./user-scripts/)

This folder is where I store all the user scripts
I use so that they can be easily ported.

## [FireMonkey](https://addons.mozilla.org/en-US/firefox/addon/firemonkey/)

The [`firemonkey-config.json`](./firemonkey-config.json) file
contains the configuration I use for FireMonkey,
a super lightweight user-script and user style manager.
It just contains the user scripts I use.

## [JShelter](https://jshelter.org/)

The [`jshelter-options.json`] file contains the settings I use for JShelter.
It's mainly just to add back the WebWorkers support that JShelter removes
by default, as it breaks a heck ton of websites.

I no longer use JShelter, because it just makes most of the web unusable,
and I have to disable it every single time for websites that use
Cloudflare's turnstile CAPTCHA, which is most sites nowadays,
making it more work than it's worth.

## [Libredirect](https://libredirect.github.io/)

The [`libredirect-settings.json`](./libredirect-settings.json)
file contains my configuration for Libredirect.
I no longer use Libredirect, and have migrated to Redirector.
Libredirect was mainly used to redirect Reddit to an open source front-end.
The Breezewiki redirect is not needed as the amazing
[Indie Wiki Buddy](https://getindie.wiki/) extension covers that.

## [Redirector](https://www.einaregilsson.com/redirector/)

The [`redirector-rules.json`](./redirector-rules.json) file
contains my redirect rules and regular expressions for Redirector.
The instructions for the [Tent](https://codeberg.org/sun/Tent) redirects
can be found on the home page of a Tent instance.
Most of the redirects are migrated from Libredirect
using my own custom regular expressions.
The redirects also make use of the excellent
[Farside](https://github.com/benbusby/farside) project
to select an instance to redirect to,
which works much better than the Libredirect selector.

## [Skip Redirect](https://github.com/sblask-webextensions/webextension-skip-redirect)

The [`skip-redirect-no-skip-list.txt`](./skip-redirect-no-skip-list.txt) file is
just a list of URLs to not skip the redirect for, as the extension is very
greedy with skipping redirects and will skip every redirect possible.
Essentially, if you have a URL as a parameter,
this extension will open that URL every single time.

## [uBlock Origin](https://ublockorigin.com/)

The [`ublock-origin-settings.txt`](./ublock-origin-settings.txt) file
is my settings for uBlock Origin, which is needed since I use medium mode
which blocks all 3rd party scripts and frames by default,
so the allowlist is necessary to use most websites properly.

## [Vimium C](https://github.com/gdh1995/vimium-c)

The [`vimium-c-config.json`](./vimium-c-config.json) file
contains my configuration for Vimium C,
most of it is simply adding aliases for various search engines.
I also configured Vimium C to open the Vomnibar when opening a new tab,
as that is what I always do anyway.

## [Vimium](https://vimium.github.io/)

The [`vimium-options.json`](./vimium-options.json) file
contains my configuration for Vimium,
which just follows the Vimium C configuration as it is just a backup.
