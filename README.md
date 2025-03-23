# Linux Config Files

The laptop that I currently use is an
[ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/),
with a Ryzen 9-7940HS processor, an AMD Radeon RX7600S GPU
and a screen resolution of 2560x1600, model number FA617X-S.
I am currently using [EndeavourOS](https://endeavouros.com/),
which is an [Arch-based](https://archlinux.org/) Linux distribution.
I'm using the [i3-wm setup with EndeavourOS](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/).

## Configuration files

The configuration files are all stored in either [`tilde`](tilde),
which refers to user-specific configuration found under `~/`,
or [`etc`](etc), which are the global configuration options
that apply to all users, which can be found under the `/etc/` folder.

### [`tilde`](tilde) folder

#### [Browser extensions](tilde/browser-extensions/)

There is a [`README.md`](tilde/browser-extensions/README.md) file
inside the [`browser-extensions`](tilde/browser-extensions/)
folder that explains the configuration.

#### [`.config`](tilde/.config/) folder

The [`.config`](tilde/.config/) folder is where the configuration
for the applications I use on Linux are located.
There is a [`README.md` file](tilde/.config/) inside that
briefly explains the configuration for the various applications inside.

#### [`.librewolf`](tilde/.librewolf/) folder

The [`.librewolf`](tilde/.librewolf/) folder is just to store my
overrides for the Librewolf browser.
All the overrides are exactly the same as my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js).

#### [`.mozilla`](tilde/.mozilla/) folder

The [`.mozilla`](tilde/.mozilla/) folder is just to store my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js).

#### [`.zen`](tilde/.zen/) folder

The [`.zen`](tilde/.zen/) folder is just to store my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js), as well as
some configuration options specific to the Zen browser.
It also contains the keyboard shortcuts and the Zen mods that
I have installed and configured for the Zen browser.

#### [`.Xresources`](tilde/.Xresources)

The [`.Xresources`](tilde/.Xresources) configuration is just to make sure
the display works properly with my high DPI screen.
I also turned on antialiasing.

#### [`.bash_profile`](tilde/.bash_profile)

The [`.bash_profile`](tilde/.bash_profile) configuration is just to
load the [`.profile`](tilde/.profile) file when starting bash.
This is needed thanks to the Arch Linux LightDM package
[changing the script to source the files](https://gitlab.archlinux.org/archlinux/packaging/packages/lightdm/-/commit/75c048cabfe9693749f5f363ab6257400d954ffa).

#### [`.bashrc`](tilde/.bashrc)

The [`.bashrc`](tilde/.bashrc) file is mostly
just the default EndeavourOS configuration,
with a few if statement added in so that
I can change the shell's directory
when using [`lf`](https://github.com/gokcehan/lf) and
[`yazi`](https://yazi-rs.github.io/).

#### [`.profile`](tilde/.profile)

This file is just to set the default applications for various tasks.
The default terminal is set to
[Kitty](https://sw.kovidgoyal.net/kitty/),
the default editor is set to
[Neovim](https://neovim.io/),
the default browser is set to
[Firefox](https://www.mozilla.org/en-US/firefox/) and
the default pager is set to
[`less`](https://www.greenwoodsoftware.com/less/).

#### [`.xinitrc`](tilde/.xinitrc)

The [`.xinitrc`](tilde/.xinitrc) file is just to merge the
configuration inside [`.Xresources`](tilde/.Xresources)
into `xrdb` so that the changes will apply.

## [Licence](LICENCE.txt)

This repository is licensed under the [MIT Licence](LICENCE.txt).
You can view the full text in the [`LICENCE.txt`](LICENCE.txt) file.
