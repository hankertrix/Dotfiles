# Linux Config Files

The laptop that I currently use is an
[ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/),
with a Ryzen 9-7940HS processor, an AMD Radeon RX7600S GPU
and a screen resolution of 2560x1600, model number FA617X-S.
It has 16GB of RAM and a 1TB SSD.
I am currently using [Arch Linux](https://archlinux.org/)
and running [Niri](https://github.com/YaLTeR/niri/)
as my window manager and Wayland compositor.

I installed [Arch Linux](https://archlinux.org/)
by manually following the
[tutorial](https://www.youtube.com/watch?v=YC7NMbl4goo)
from [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).
There is also a
[written guide](https://github.com/dreamsofautonomy/arch-from-scratch)
if you prefer to read instead of watching a video.

If you are using [btrfs](https://btrfs.readthedocs.io/en/latest/index.html),
which you would be if you are following the guide above,
you should also install [btrfs-progs](https://github.com/kdave/btrfs-progs)
so that the `mkinitcpio` hook to create the `initramfs` for the kernel
doesn't throw an error due to `fsck` not being available.
The system will still work fine even without installing
[btrfs-progs](https://github.com/kdave/btrfs-progs),
but the error gets annoying as it appears every time you update the kernel,
and it might trick you into thinking there is actually an error in the
`mkinitcpio` build hook for the kernel when there actually isn't.

## Configuration files

I am making use of [Chezmoi (pronounced shay-mwa)](https://www.chezmoi.io/)
to manage my configuration files. To use my configuration files,
install [Chezmoi](https://www.chezmoi.io/install/),
and [Git](https://git-scm.com/),
then run the command below to deploy the configuration files:

```sh
ROOTMOI=t chezmoi init hankertrix/dotfiles --source ~/.dotfiles --apply
```

If you don't want to deploy the system level configuration files,
remove the `ROOTMOI=t` at the front of the command to
only deploy the user level configuration files, like this:

```sh
chezmoi init hankertrix/dotfiles --source ~/.dotfiles --apply
```

You can also choose another directory to store the source directory,
but take note that references to the `~/.dotfiles` directory in the
[Emacs configuration](./tilde/dot_config/emacs/config.org)
need to be changed to point to the correct source directory
instead of `~/.dotfiles`. The reason for not templating
the reference to `~/.dotfiles` in the Emacs configuration
is due to Emacs not having an easy way to set the file type,
or to ignore the `.tmpl` file extension.

The configuration files are all stored in either [`tilde`](./tilde/),
which refers to user-specific configuration found under `~/`,
or [`slash`](./slash/), which are the global configuration options
that apply to all users, which can be found under the `/` folder.

### [Browser extensions](./browser-extensions/) folder

There is a [`README.md`](./browser-extensions/README.md) file
inside the [`browser-extensions`](./browser-extensions/)
folder that explains the configuration.

### [Custom packages](./custom-packages/) folder

This folder stores all the packages that are custom-built for me.
It currently only contains the PKGBUILD for building all 3
Nerd Font variants for [Maple Mono](https://github.com/subframe7536/Maple-font),
with the font features I want frozen so that they work in
[Emacs](https://www.gnu.org/software/emacs/).
Maple Mono only provides the default Nerd Font variant, but
I need all 3 variants as I use the Propo variant in GUI applications
like [Waybar](https://github.com/Alexays/Waybar) and
[Rofi](https://github.com/davatorium/rofi) to ensure the icons
don't have funky spacing.
The Mono variant is used in the browser by
[Firenvim](https://github.com/glacambre/firenvim) so that the icons
are not cut off.
The default variant is used in the terminals I use.

### [Package lists](./package-lists/) folder

This folder stores the package lists for my system.
The [main package list](./package-lists/pkglist.txt) contains all the packages
installed through a repository using Pacman, while the
[AUR package list](./package-lists/aur-pkglist.txt) contains all the packages
installed through the [AUR](https://aur.archlinux.org),
as well as custom packages.

### [`slash`](./slash/)

The [`slash`](./slash/) folder contains all the system level configuration,
such as configuration files for the package manager, the display manager
and the bootloader.

#### [`boot`](./slash/boot/) folder

The [`boot`](./slash/boot/) folder contains the configuration for
the bootloader I use, [rEFInd](https://www.rodsbooks.com/refind/).
The [rEFInd configuration](./slash/boot/refind_linux.conf)
is just the standard boot options that are provided by default
when running `refind-install`. However, the `amdgpu.dcdebugmask` option
is added so that the AMD driver doesn't crash or lock up.
There is a really helpful
[tutorial here](https://discuss.cachyos.org/t/tutorial-mitigate-gfx-crash-lockup-apparent-freeze-with-amdgpu/10842).

The theme I use is a modified version of the Gruvbox theme from
[rEFInd minimal themes](https://github.com/quantrancse/rEFInd-minimal-themes).
The selection icons were taken from [dm](https://github.com/mustaqimM/dm),
which itself is a modified version of the
[Dream Machine theme](https://github.com/Lindstream/dm-refind-theme).

The background image was taken from
[Pexels](https://www.pexels.com/photo/planet-earth-in-black-background-12990385/).

#### [`etc`](./slash/etc/) folder

The [`etc`](./slash/etc/) folder contains the configuration for
system level configuration files.

##### [`ly`](./slash/etc/ly/)

The [`ly` configuration](./slash/etc/ly/config.ini) is just
the default configuration file but with the animation changed
to use the matrix animation.

##### [Network Manager](./slash/etc/NetworkManager/)

The Network manager configuration

#### [`.chezmoiignore`](./slash/.chezmoiignore)

The `.chezmoiignore` file ignores the files that do not need to be
deployed to the system, like READMEs and licences,
but also ignores the [`boot/efi`](slash/boot/efi) directory
so that `rootmoi` can apply the changes to the `/boot/efi` directory
separately from the `/` directory.

### [`tilde`](./tilde/) folder

#### [`.chezmoiscripts`](./tilde/.chezmoiscripts/)

The [`.chezmoiscripts`](./tilde/.chezmoiscripts/) folder is just to store
the scripts that run with Chezmoi. It currently only contains
a script to run `rootmoi` after the Chezmoi configuration is applied.

#### [`.config`](./tilde/dot_config/) folder

The [`.config`](./tilde/dot_config/) folder is where the configuration
for the applications I use on Linux are located.
There is a [`README.md` file](./tilde/dot_config/) inside that
briefly explains the configuration for the various applications inside.

#### [`.librewolf`](./tilde/dot_librewolf/) folder

The [`.librewolf`](./tilde/dot_librewolf/) folder is just to store my
overrides for the Librewolf browser.
All the overrides are exactly the same as my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js).

#### [`.mozilla`](./tilde/dot_mozilla/) folder

The [`.mozilla`](./tilde/dot_mozilla/) folder is just to store my overrides
for the [Arkenfox user.js](https://github.com/arkenfox/user.js).

#### [`.local`](./tilde/dot_local/) folder

The [`bin`](./tilde/dot_local/bin/) folder in the
[`.local`](./tilde/dot_local/) folder is just to store some useful scripts
I made that can also be run as a standalone script,
like a script to easily select the wallpapers based on
the current system theme, a screen recording script,
and rootmoi, which runs Chezmoi as root to manage
system configuration.

The [`share`](./tilde/dot_local/share/) folder inside is to store
the scripts to run when [darkman](https://gitlab.com/WhyNotHugo/darkman)
changes from light to dark mode, which handles switching the wallpapers
and dynamically theming everything.

#### [`.zen`](./tilde/dot_zen/) folder

The [`.zen`](./tilde/dot_zen/) folder is just to store my overrides for the
[Arkenfox user.js](https://github.com/arkenfox/user.js), as well as
some configuration options specific to the Zen browser.
It also contains the keyboard shortcuts and the Zen mods that
I have installed and configured for the Zen browser.

#### [`.chezmoi.toml`](./tilde/.chezmoi.toml.tmpl)

The [`.chezmoi.toml`](./tilde/.chezmoi.toml.tmpl) is just to configure
the source directory for [Chezmoi](https://www.chezmoi.io/)
and use [Neovim](https://neovim.io/) as the merge tool.

#### [`.chezmoidata.toml`](./tilde/.chezmoidata.toml)

The [`.chezmoidata.toml`](./tilde/.chezmoidata.toml) file is just to store
additional variables that are used in the Chezmoi templates.
They are mostly just fonts, icon theme, cursor theme and cursor size.

#### [`.chezmoiexternal.toml`](./tilde/.chezmoiexternal.toml)

The [`.chezmoiexternal.toml`](./tilde/.chezmoiexternal.toml) file is just to
automatically download all the different variations of the cursor theme
I use and put them in the right place.

#### [`.chezmoiignore`](./tilde/.chezmoiignore)

The `.chezmoiignore` file is just to ignore the files that do not need to be
deployed to the system, like READMEs, licences,
and formatter configuration files.

#### [`.bash_profile`](./tilde/dot_bash_profile)

The [`.bash_profile`](./tilde/dot_bash_profile) configuration is just to
load the [`.profile`](./tilde/executable_dot_profile) file
when starting bash.
This is needed thanks to the Arch Linux LightDM package
[changing the script to source the files](https://gitlab.archlinux.org/archlinux/packaging/packages/lightdm/-/commit/75c048cabfe9693749f5f363ab6257400d954ffa).

This change may or may not be relevant since I am now using
[ly](https://codeberg.org/fairyglade/ly), instead of LightDM,
but things are working fine, so I'm not going to change it.

#### [`.inputrc`](./tilde/dot_inputrc)

The [`.inputrc`](./tilde/dot_inputrc) file is just to set the key binds
for arrow up and arrow down to search the history for completions
instead of just giving the last used command.

#### [`.xinitrc`](./tilde/dot_xinitrc)

The [`.xinitrc`](./tilde/dot_xinitrc) file is just to merge the
configuration inside [`.Xresources`](./tilde/executable_dot_Xresources)
into `xrdb` so that the changes will apply.

This file is no longer relevant since I am no longer on X11,
but I am keeping it here just in case.

#### [`.Xresources`](./tilde/executable_dot_Xresources)

The [`.Xresources`](./tilde/executable_dot_Xresources)
configuration is just to make sure
the display works properly with my high DPI screen.
I also turned on antialiasing.

This file is no longer relevant since I am no longer on X11,
but I am keeping it here just in case.

#### [`.bashrc`](./tilde/executable_dot_bashrc)

The [`.bashrc`](./tilde/executable_dot_bashrc) file is quite minimal,
just setting some useful settings like `vi` mode and the prompt.

It also has some useful aliases that are provided by
[Arch Linux](https://archlinux.org/) by default, mostly just colouring
the output of `grep` and `ls` and useful aliases for `ls`.

It also adds the [local binaries](./tilde/dot_local/bin/) to the shell path and
has a few if statement added in so that I can change the shell's directory
when using [`lf`](https://github.com/gokcehan/lf) and
[`yazi`](https://yazi-rs.github.io/).

#### [`.profile`](./tilde/executable_dot_profile)

This file is just to set the default applications for various tasks.
The default terminal is set to
[Ghostty](https://sw.kovidgoyal.net/kitty/),
the default editor is set to
[Neovim](https://neovim.io/),
the default browser is set to
[Firefox](https://www.mozilla.org/en-US/firefox/) and
the default pager is set to
[`less`](https://www.greenwoodsoftware.com/less/).

### [Wallpapers folder](./tilde/wallpapers/)

This folder just contains all the wallpapers I use,
sourced from various places, separated into two subfolders,
[one](./tilde/wallpapers/light/) containing wallpapers to use for the
light system theme,
and [another](./tilde/wallpapers/dark/) for the dark system theme.

## [Licence](LICENCE.txt)

This repository is licensed under the [MIT Licence](LICENCE.txt).
You can view the full text in the [`LICENCE.txt`](LICENCE.txt) file.
