# Linux Config Files

The configuration files are located in `~/` or `/home/username/`.
The laptop that I currently use is an
[ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/),
with a Ryzen 9-7940HS processor, an AMD Radeon RX7600S GPU
and a screen resolution of 2560x1600.
I am currently using [EndeavourOS](https://endeavouros.com/),
which is an [Arch-based](https://archlinux.org/) Linux distribution.
I'm using the [i3-wm setup with EndeavourOS](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/).

## Configuration files

### [`.config` folder](.config/)

The [`.config` folder](.config) is where the configuration
for the applications I use on Linux are located.
There is a README inside that briefly explains the configuration
for the various applications inside.

### [`.mozilla` folder](.mozilla/)

The [`.mozilla` folder](.mozilla/) is just to store my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js).

### [`.Xresources`](.Xresources)

The [`.Xresources`](.Xresources) configuration is just to make sure
the display works properly with my high DPI screen.
I also turned on antialiasing.

### [`.bash_profile`](.bash_profile)

The [`.bash_profile`](.bash_profile) configuration is just to
load the [`.profile`](.profile) file when starting bash.
This is needed thanks to the Arch Linux LightDM package
[changing the script to source the files](https://gitlab.archlinux.org/archlinux/packaging/packages/lightdm/-/commit/75c048cabfe9693749f5f363ab6257400d954ffa).

### [`.bashrc`](.bashrc)

The [`.bashrc`](.bashrc) file is mostly
just the default EndeavourOS configuration,
with a few if statement added in so that
I can change the shell's directory
when using [`lf`](https://github.com/gokcehan/lf) and
[`yazi`](https://yazi-rs.github.io/).

### [`.profile`](.profile)

This file is just to set the default applications for various tasks.
The default terminal is set to
[Wezterm](https://wezfurlong.org/wezterm/index.html),
the default editor is set to
[Neovim](https://neovim.io/),
the default browser is set to
[Firefox](https://www.mozilla.org/en-US/firefox/) and
the default pager is set to
[`less`](https://www.greenwoodsoftware.com/less/).

### [`.xinitrc`](.xinitrc)

The [`.xinitrc`](.xinitrc) file is just to merge the
configuration inside [`.Xresources`](.Xresources)
into `xrdb` so that the changes will apply.

## [Licence](LICENCE.txt)

This repository is licensed under the [MIT Licence](LICENCE.txt).
You can view the full text in the [`LICENCE.txt`](LICENCE.txt) file.
