# Application Config Files

Here are all the config files for the applications I use on Linux,
all located within `~/.config/`, or `/home/username/.config/`.

## Browser extensions

There is a [`README.md`](./browser_extensions/README.md) file
inside the [`browser_extensions`](./browser_extensions/)
folder that explains the configuration.

## [Dunst](https://github.com/dunst-project/dunst)

My `dunst` configuration is simply the default EndeavourOS configuration
with the `height` changed to `maximum_height`.

## [EFM Language Server](https://github.com/mattn/efm-langserver)

EFM Language Server is a general purpose language server
that essentially allows you to use your linters and formatters
as an LSP server. The [`config.yaml`](./efm-langserver/config.yaml) file
just contains my configuration for the EFM Language Server.
Most of the configuration is just the default configuration taken from the
[Neovim EFM Language Server configuration repository](https://github.com/creativenull/efmls-configs-nvim)
ported to the YAML file configuration format.

## [Emacs](https://www.gnu.org/software/emacs/)

There is a [`config.org`](./emacs/config.org) file inside the
[`emacs`](./emacs/) folder that contains my configuration for Emacs.

## [i3](https://i3wm.org/)

The i3 configuration is for the most part,
the default configuration from EndeavourOS.
There are only a few changes in the
[`i3/config`](./i3/config) file to change the background,
the terminal and the default utility to adjust the screen brightness.
I also changed some of the scripts to work with the applications I use,
as well as the workspace icons, so they look better on my laptop.
It is mostly just adding spaces and thin spaces so that the icons
have sufficient space away from the text and don't overlap with the text.

## [Kitty](https://sw.kovidgoyal.net/kitty/)

Similarly, the kitty configuration is mostly just adding the
[Bluloco Dark](https://github.com/uloco/bluloco.nvim) colour scheme to kitty
and changing the default font to
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).
The auto update function for kitty has also been disabled.
The default font size is also set to 12.

## [lf](https://github.com/gokcehan/lf)

There is a [`README.md`](./lf/README.md) file inside
the [`lf`](./lf) folder that explains the configuration.

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
[Bluloco Dark](https://github.com/uloco/bluloco.nvim).
The default font has also been changed to use
[Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode)
and the font size has been set to 12.
The `TERM` environment variable is also set to use
`wezterm` and I increased the underline thickness
so the underlines in [Neovim](https://neovim.io/)
and [Yazi](https://yazi-rs.github.io/) aren't too thin.

## [Yazi](https://yazi-rs.github.io/)

There is a [`README.md`](./yazi/README.md) file
inside the [`yazi`](./yazi/) folder that explains the configuration.

## [Clight]

The clight configuration file, [`clight.conf`](./clight.conf)
is mostly just to disable all the functionality of clight that
I don't use, and to set the time and the temperature for
the red-shifter.

## [Gummy](https://codeberg.org/fusco/gummy)

The gummy configuration file, [`gummyconf.json`](./gummyconf.json)
is to set the time and temperature for the red-shifter
and the default backlight brightness.
I no longer use Gummy as it is unmaintained and doesn't work
with `sdbus-c++` version `2.0.0` and above, which is the current
Arch Linux version.

## [Stylua](https://github.com/JohnnyMorganz/StyLua)

The [`stylua.toml`](./stylua.toml) file in this repository is just
to set the format options to format my Lua code in the
[Neovim](./nvim/) and [Wezterm](./wezterm/) configuration.
