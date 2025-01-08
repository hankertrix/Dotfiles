# Application Config Files

Here are all the config files for the applications I use on Linux,
all located within `~/.config/`, or `/home/username/.config/`.

## [Browser extensions](./browser_extensions/)

There is a [`README.md`](./browser_extensions/README.md) file
inside the [`browser_extensions`](./browser_extensions/)
folder that explains the configuration.

## [Darkman](https://gitlab.com/WhyNotHugo/darkman)

The [configuration for `darkman`](./darkman/config.yaml) is very simple,
the configuration file here is literally all the values you can change
about `darkman`. It just sets the location for changing the theme
automatically, and also enables `dbus` and the `xdg-desktop-portal`
integration, while disabling `geoclue`.

## [Dunst](https://github.com/dunst-project/dunst)

My [`dunst` configuration](./dunst/dunstrc) is simply the default
EndeavourOS configuration with the `height` changed to `maximum_height`.

## [EFM Language Server](https://github.com/mattn/efm-langserver)

EFM Language Server is a general purpose language server
that essentially allows you to use your linters and formatters
as an LSP server.
If you know about [null-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
for [Neovim](https://neovim.io/), EFM Language Server is basically that
plugin, but as a general purpose language server that you can use in
any editor, instead of just [Neovim](https://neovim.io/).
The [`config.yaml`](./efm-langserver/config.yaml) file
contains my configuration for EFM Language Server.
Most of the configuration is just the default configuration taken from the
[Neovim EFM Language Server configuration repository](https://github.com/creativenull/efmls-configs-nvim)
ported to the YAML file configuration format.

## [Emacs](https://www.gnu.org/software/emacs/)

There is a [`config.org`](./emacs/config.org) file inside the
[`emacs`](./emacs/) folder that contains my configuration for Emacs.

## [Ghostty](https://github.com/ghostty-org/ghostty)

The [Ghostty configuration](./ghostty/config) sets the theme to
[Bluloco](https://github.com/uloco/bluloco.nvim),
sets the default font to
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode),
sets the default font size to 12, maps `Ctrl + [` to `ESC` and
hides the mouse when typing.
It also increases the cursor width to not have the cursor be so thin,
disables the title bar and the resize overlay, and sets the window
theme to use the colours used in Ghostty.
The auto update function for Ghostty is also disabled.

## [i3](https://i3wm.org/)

The i3 configuration is for the most part,
the default configuration from EndeavourOS.
There are only a few changes in the
[`config`](./i3/config) file to change the background,
the terminal and the default utility to adjust the screen brightness.
I also changed some of the scripts to work with the applications I use,
as well as the workspace icons, so they look better on my laptop.
It is mostly just adding spaces and thin spaces so that the icons
have sufficient space away from the text and don't overlap with the text.

## [Kitty](https://sw.kovidgoyal.net/kitty/)

The kitty configuration is mostly just adding the
[Bluloco](https://github.com/uloco/bluloco.nvim) colour scheme to kitty
and changing the default font to
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).
The auto update function for kitty has also been disabled.
The default font size is also set to 12.

## [lf](https://github.com/gokcehan/lf)

There is a [`README.md`](./lf/README.md) file inside
the [`lf`](./lf) folder that explains the configuration.

## [Neovide](https://neovide.dev/)

The Neovide configuration just sets the font size to 12, and the font to
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).

## [Neovim](https://neovim.io/)

There is a [`README.md`](./nvim/README.md) file inside
the [`nvim`](./nvim) folder that lists all the plugins I use.

## [Rofi](https://github.com/davatorium/rofi)

The Rofi configuration, like the i3 configuration,
is for the mostly just the default configuration from EndeavourOS.
There are a few changes to the theme files to make them look better,
as the default theme files end up making the windows
too small for the entire text display.

## [Wezterm](https://wezfurlong.org/wezterm/index.html)

For the most part, the Wezterm configuration is just adding the
[Bluloco Light](https://github.com/uloco/bluloco.nvim) and
[Bluloco Dark](https://github.com/uloco/bluloco.nvim) colour scheme
and setting the default colour scheme to
[Bluloco](https://github.com/uloco/bluloco.nvim).
There is also a function to get Wezterm to automatically change
the colour scheme when the system theme changes as well.
The default font has also been changed to use
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)
and the font size has been set to 12.
The `TERM` environment variable is also set to use
`wezterm` and I increased the underline thickness
so the underlines in [Neovim](https://neovim.io/)
and [Yazi](https://yazi-rs.github.io/) aren't too thin.

## [XDG Desktop Portal](https://flatpak.github.io/xdg-desktop-portal/)

The [XDG Desktop Portal configuration](./xdg-desktop-portal/portals.conf)
is just to set the preferred default portal implementation to
[`xdg-desktop-portal-gtk`](https://github.com/flatpak/xdg-desktop-portal-gtk),
which is a generic implementation that works on most tiling window managers
running [X](https://www.x.org/archive/X11R7.6/doc/man/man1/Xserver.1.xhtml).
The implementation for the settings portal is also set to
[darkman](https://gitlab.com/WhyNotHugo/darkman) so that applications can
detect when the theme changes from light to dark and vice versa.

## [Yazi](https://yazi-rs.github.io/)

There is a [`README.md`](./yazi/README.md) file
inside the [`yazi`](./yazi/) folder that explains the configuration.

## [Clight](https://github.com/FedeDP/Clight)

The Clight configuration file, [`clight.conf`](./clight.conf)
is mostly just to disable all the functionality of Clight that
I don't use, and to set the location and the temperature for
the red-shifter.

## [Gummy](https://codeberg.org/fusco/gummy)

The Gummy configuration file, [`gummyconf.json`](./gummyconf.json)
is to set the time and temperature for the red-shifter
and the default backlight brightness.
I no longer use Gummy as it is unmaintained and doesn't work
with [`sdbus-c++`](https://github.com/Kistler-Group/sdbus-cpp)
version `2.0.0` and above, which is the current Arch Linux version.

## [Stylua](https://github.com/JohnnyMorganz/StyLua)

The [`stylua.toml`](./stylua.toml) file in this repository is just
to set the format options to format my Lua code in the
[Neovim](./nvim/) and [Wezterm](./wezterm/) configuration.
