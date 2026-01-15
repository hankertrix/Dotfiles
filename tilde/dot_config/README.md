# Application Config Files

Here are all the config files for the applications I use on Linux,
all located within `~/.config/`, or `/home/username/.config/`.

## [Btop](https://github.com/aristocratos/btop)

The [configuration for `btop`](./btop/btop.conf) is just the default
configuration with Vim keybindings enabled.

## [Darkman](https://gitlab.com/WhyNotHugo/darkman)

The [configuration for `darkman`](./darkman/config.yaml) is very simple,
the configuration file here is literally all the values you can change
about `darkman`. It just sets the location for changing the theme
automatically, and also enables `dbus` and the `xdg-desktop-portal`
integration, while disabling `geoclue`.

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

## [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

The [configuration for `fastfetch`](./fastfetch/config.jsonc)
is a modified version of a
[configuration](https://forum.endeavouros.com/t/fastfetch-config-tinkering/60919/79)
I found on the EndeavourOS forums with a few modules removed
and some keys changed.
I also changed the image to show Arch's legacy wombat logo because it's cute.

## [Fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/)

The [Fontconfig configuration](./fontconfig/fonts.conf) just enables
the alternate not equals `~=` in Lua (`SS02`) for
[Cascadia Code](https://github.com/microsoft/cascadia-code) and enables
dotted zero (`zero`), double-headed arrows (`SS08`)
and slashed z (`cv10` and `cv43`) for
[Maple Mono](https://github.com/subframe7536/Maple-font).

## [Gammastep](https://gitlab.com/chinstrap/gammastep)

Gammastep is a red-shifter similar to Gummy and Clight,
but it doesn't control brightness at all and only works on Wayland.
The [gammastep configuration](./gammastep/config.ini) is just to
set the colour temperatures during the day and night and
the location.

## [Ghostty](https://github.com/ghostty-org/ghostty)

The [Ghostty configuration](./ghostty/config) sets the theme to
[Bluloco](https://github.com/uloco/bluloco.nvim),
sets the default font to
[Maple Mono](https://github.com/subframe7536/Maple-font),
sets the font size, maps a bunch of key binds and
hides the mouse when typing.
It also increases the cursor width to not have the cursor be so thin,
disables the title bar, the resize overlay, the window decorations,
and sets the window theme to use the colours used in Ghostty.
The auto update function for Ghostty is also disabled.

## [Kitty](https://sw.kovidgoyal.net/kitty/)

The [kitty configuration](./kitty/kitty.conf.tmpl) is mostly just adding the
[Bluloco](https://github.com/uloco/bluloco.nvim) colour scheme to kitty
and changing the default font to
[Maple Mono](https://github.com/subframe7536/Maple-font)
and setting the font size.
It also maps a bunch of key binds, turns off the audio bell
and has the themes I want for light mode and dark mode.
The auto update function for kitty has also been disabled.

The other configuration files inside are just to get kitty to automatically
set the theme based on the system theme.

## [`mpd`](https://www.musicpd.org/)

`mpd` is a music player daemon that allows you to play music in the background
without having any application open. It requires a music player client to
interact with it. The [configuration](./mpd/mpd.conf) is taken from
the default configuration in the `/usr/share/doc/mpd/mpdconf.example` file,
with the database file, sticker file and playlist directory placed
in sensible locations.
Following symlinks and auto update is also turned on,
so there's no need to manually update the music database.

The audio output configuration includes the output to the system audio,
and the output to a FIFO so that music player clients like `rmpc` and `ncmpcpp`
can make use of the FIFO for the visualiser.
The system audio output is necessary, otherwise `mpd` will just output audio
to the FIFO and you won't be able to hear anything.

## [`mpv`](https://mpv.io/)

`mpv` is a video player that is extremely performant and lightweight.
The [input configuration for `mpv`](./mpv/input.conf) is just to
set Vim key bindings for the `mpv` instead of using the arrow keys.
The [configuration for `mpv`](./mpv/mpv.conf) is just to disable
mpv keeping the window's aspect ratio so I can resize it with
my window manager.

## [Niri](https://github.com/YaLTeR/niri)

Niri is the scrolling window manager that I use.
It solves the main issue with tiling window managers on small screens
like laptops as you can have maximised windows right beside each other
instead of having them on separate workspaces, making it much easier
to switch between windows.

You can learn more about scrolling window managers from
[Brodie Robertson's video](https://www.youtube.com/watch?v=r0JUm77inIA)
and more about Niri from
[another video of his](https://www.youtube.com/watch?v=DeYx2exm04M).

The [configuration](./niri/config.kdl.tmpl) is mostly just
the default configuration with some flair added, like rounded corners,
a rainbow gradient for the focus ring, and some additional key binds,
like for screenshots, screen recording,
and calling a custom script to change the volume, brightness and
mic mute state to show a notification with a progress bar
to show the current level.

## [Neovim](https://neovim.io/)

There is a [`README.md`](./nvim/README.md) file inside
the [`nvim`](./nvim/) folder that lists all the plugins I use.

## [Paru](https://github.com/Morganamilo/paru)

The [Paru configuration](./paru/paru.conf) is mainly just to set
sensible options for the AUR helper and add my
[custom packages](../../custom-packages/) as a repository so
I can install my own packages.

## [`rmpc`](https://github.com/mierak/rmpc)

The [`rmpc` (Rusty Music Player Client)](./rmpc/config.ron)
configuration is mostly just the default configuration with some options
and some additional key binds to fit my muscle memory.
Cava is also added to the queue pane so I can have a nice visualiser
when playing music. The Cava configuration follows the `mpd` configuration.

The theme for `rmpc` can be found inside the
[Wallust templates directory](./wallust/templates/rmpc-dynamic-theme.ron),
as it is dynamically themed based on the colours in the wallpaper.

## [Rofi](https://github.com/davatorium/rofi)

The [Rofi configuration](./rofi/config.rasi.tmpl) is inspired by
[My Linux For Work's Rofi configuration](https://github.com/mylinuxforwork/dotfiles/blob/main/share/dotfiles/.config/rofi/config.rasi),
mainly the background being the wallpaper image.
The rest of the configuration has been changed to fit my liking,
like having a vertical format for the apps and showing the mode switcher
in a horizontal bar at the bottom.

The colours for Rofi can be found inside the
[Wallust templates directory](./wallust/templates/rofi-colours.rasi),
as it is also dynamically themed based on the colours in the wallpaper.

## [`rootmoi`](https://www.chezmoi.io/)

This directory stores the configuration for my custom script that runs
Chezmoi as root.
There is a [configuration file](./rootmoi/root-chezmoi.toml.tmpl) for applying
the system configuration, and another
[configuration file](./rootmoi/efi-chezmoi.toml.tmpl) for applying
the bootloader configuration.

The reason for the split configuration between the `/boot/efi` directory
and the `/` directory is that the `/boot/efi` directory containing
the bootloader configuration is not a Linux file system partition
like Ext4 or btrfs, so it does not have any concept of file permissions.
Instead, the bootloader is a FAT32 file system,
so the umask to set the permissions needs to be changed to the default
file permissions that Linux gives the FAT32 file system,
which is `750` for directories and `640` for files,
resulting in an umask of `0o27` for the directory,
which is different from the default umask of `0o22` for Linux file systems.

All this is so that `rootmoi` doesn't show permission changes
when applying the bootloader configuration, making it difficult to know
whether the bootloader configuration did actually change or
just has different file permissions.

You will also notice that the [`slash/`](../../slash/) directory has
the [`boot/efi`](../../slash/boot/efi/) directory ignored,
so that `rootmoi` doesn't run on the `/boot/efi` directory
when applying the system configuration files in the `/` directory.

## [Satty](https://github.com/gabm/Satty)

Satty is a screenshot editor for Wayland that works quite similarly to
Flameshot. The [Satty configuration](./satty/config.toml) is mostly just
the default configuration but with the initial tool
and corner roundness changed.

## [`swayidle`](https://github.com/swaywm/swayidle)

`swayidle` is an idle daemon which allows you to run scripts after
certain events. For example, after a timeout of 10 minutes,
you can automatically lock and turn off the screen to save power.
The [configuration](./swayidle/config) is mostly taken from
[Niri's example `systemd` setup](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
with the timeout changed to 15 minutes instead of 10,
and the screen powering off after 5 seconds instead of 1 second
after the screen is locked.

## [`systemd`](https://systemd.io/)

The [`systemd`](./systemd/user/) directory just contains the service files
I need to run as daemons like `swayidle`, `swww`, `cliphist`.
and my polkit agent. The `swayidle` service file is taken from
[Niri's example `systemd` setup](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)
with a description and an install section added.

## [Wallust](https://codeberg.org/explosion-mental/wallust)

Wallust is the colour palette generator I use to generate the colours
from the wallpapers to dynamically theme my applications.

The [`templates/` directory](./wallust/templates/) contains all the
Wallust templates to dynamically theme some applications
or certain parts of some applications.

### [`wallust.toml`](https://explosion-mental.codeberg.page/wallust/config/)

The [`wallust.toml` file](./wallust/wallust.toml)
configures Wallust, and it is mostly taken from
[JaKooLit's configuration](https://github.com/JaKooLit/Hyprland-Dots/blob/main/config/wallust/wallust.toml).
The backend is set to `kmeans` and the colour space is set to `labmixed`
to obtain the best colours for all wallpapers.

The rest of the file is just placing the templates in the
[Wallust templates directory](./wallust/templates/) in the correct places.

### [Cava](https://github.com/karlstav/cava)

The [Cava configuration](./wallust/templates/cava-config) is mostly just the
defaults with the colours for the background, foreground
and the gradients added.

### [Dunst](https://dunst-project.org/)

The [Dunst configuration](./wallust/templates/dunstrc.tmpl) is also mostly just
the defaults with a different offset, corner radius, colours and highlights,
and a different `dmenu` path that links to Rofi.

### [Ghostty dynamic theme](https://ghostty.org/docs/features/theme)

The [Ghostty dynamic theme](./wallust/templates/ghostty-dynamic-theme.conf)
is just filling all the 16 colours and using the Kitty theme from
[`hellwal`](https://github.com/danihek/hellwal/blob/main/templates/kitty-colors.conf)
and [`pywal`](https://github.com/dylanaraps/pywal/blob/master/pywal/templates/colors-kitty.conf)
to fill in the rest.

### [GTK styles](https://www.gtk.org/)

The [GTK styles](./wallust/templates/gtk.css) just takes the colours from
[My Linux For Work's configuration](https://github.com/mylinuxforwork/dotfiles/blob/main/share/dotfiles/.config/matugen/templates/gtk-colors.css)
converts it to Wallust colours using the
[Material You template](https://codeberg.org/explosion-mental/wallust-templates/src/branch/master/material-you.j2)
and adds some of the styles from
[Hellwal's template](https://github.com/danihek/hellwal/blob/main/templates/gtk.css)
to remove the rounded borders from the client side decorations (CSD)
on GTK apps so I can control the rounded borders
at the Wayland compositor level.

### [GTK3 settings](https://docs.gtk.org/gtk3/class.Settings.html)

The [GTK3 settings](./wallust/templates/gtk3-settings.ini.tmpl) are adapted from
[My Linux For Work's configuration](https://github.com/mylinuxforwork/dotfiles/blob/main/share/dotfiles/.config/gtk-3.0/settings.ini)
and just sets them to the stuff I want to use.
This file is a template mainly because of the
`gtk-application-prefer-dark-theme` setting,
which needs to be templated so that GTK3 apps will follow the system theme.
Without this setting present, GTK3 apps will just default to the light theme.

### [Kitty dynamic theme](https://sw.kovidgoyal.net/kitty/kittens/themes/)

The [Kitty dynamic theme](./wallust/templates/kitty-dynamic-theme.conf)
is just filling all the 16 colours and using the Kitty theme from
[Hellwal](https://github.com/danihek/hellwal/blob/main/templates/kitty-colors.conf)
and [Pywal](https://github.com/dylanaraps/pywal/blob/master/pywal/templates/colors-kitty.conf)
to fill in the rest.

### [Pywalfox](https://github.com/Frewacom/pywalfox)

Pywalfox is a browser extension that themes your Firefox, Thunderbird,
and DuckDuckGo to match your dynamically generated colours from the wallpaper.
The [configuration](./wallust/templates/pywalfox-colours.json) is taken from
[Pywal's colours file](andhttps://github.com/dylanaraps/pywal/blob/master/pywal/templates/colors.json)
and templated to the same location as where Pywal would put it
to make Wallust work with Pywalfox.

### [`rmpc` theme](https://mierak.github.io/rmpc/next/configuration/theme/)

The [`rmpc` theme](./wallust/templates/rmpc-dynamic-theme.ron)
contains all the appearance related things about `rmpc`.
Most of the colours are changed to be dynamically generated based on the
wallpapers, and the icons have been changed to fit my tastes.

I also made a new progress bar component and moved some of the information
in the header, like play/pause status and elapsed duration into the component.

The Cava configuration within `rmpc` just follows the
[Cava configuration](./wallust/templates/cava-config)
for the bar colours, but doubled up because each colour only takes up one bar,
which isn't really that long, so the visualiser ends up looking quite small.

### [Rofi colours](https://davatorium.github.io/rofi/current/rofi-theme.5/)

The [Rofi colours](./wallust/templates/rofi-colours.rasi) are adapted from
[JaKooLit's configuration](https://github.com/JaKooLit/Hyprland-Dots/blob/main/config/wallust/templates/colors-rofi.rasi),
but have different colours.

### [`swaylock`](https://github.com/swaywm/swaylock)

The [`swaylock` configuration](./wallust/templates/swaylock-config.tmpl)
is mainly just setting the colours and font to work with colours generated
from the wallpaper, and to always daemonise it,
ignore empty passwords and show failed attempts.

### [Waybar calendar](https://github.com/Alexays/Waybar/wiki/Module:-Clock)

The [Waybar calendar configuration](./wallust/templates/waybar-calendar.jsonc.tmpl)
is mostly just the
[default configuration](https://github.com/Alexays/Waybar/wiki/Module:-Clock)
on the Waybar wiki but with set the colours for the calendar
to work with colours generated from the wallpaper, and invert the scrolling,
as scrolling down should increase the year or month and scrolling up should
decrease the year or month.

### [Waybar colours](https://github.com/Alexays/Waybar/wiki/Styling)

The [Waybar colours](./wallust/templates/waybar-colours.css)
is taken from the
[Wallust template](https://codeberg.org/explosion-mental/wallust-templates/src/branch/master/waybar.css)
for Waybar with some additional colours added in.

## [Waybar](https://github.com/Alexays/Waybar)

The [Waybar configuration](./waybar/config.jsonc)
is quite similar to the
[default configuration](https://github.com/Alexays/Waybar/blob/master/resources/config.jsonc)
but with some modules added and some removed and all rearranged to my liking.
The icons for the workspaces have been changed as well,
and there is a custom module for recording the screen.
The Wi-Fi module also opens up a Wi-Fi selection menu using Rofi,
and the volume indicator can be clicked to toggle the mute.

The clock module also expands out to reveal the date,
and after hovering over it for a bit, displays the calendar as a tooltip.
The volume indicator also expands out to reveal song or video that is currently
being played, with controls to play, pause, go to the next track
and go to the previous track.

The [styles](./waybar/style.css.tmpl) are also configured to work with
the colours generated from the wallpaper, and to work in
both light and dark theme. The main bulk of the styles is just
rounding the borders around each of the modules or groups of modules.

## [Wezterm](https://wezfurlong.org/wezterm/index.html)

For the most part, the [Wezterm configuration](./wezterm/wezterm.lua.tmpl)
is just adding the
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

## [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)

The [`config`](./yt-dlp/config) file just sets the JavaScript runtime to Node.

## [MIME Applications](https://specifications.freedesktop.org/mime-apps-spec/latest/file.html)

The [MIME Applications configuration file](./mimeapps.list)
just sets the default applications for the various file types and
adds associations for some mime types to installed applications.

## [Polycat](https://github.com/2IMT/polycat)

Polycat is a [RunCat](https://github.com/Kyome22/RunCat365) module
for Polybar and Waybar. The configuration is just the default configuration.

## [Stylua](https://github.com/JohnnyMorganz/StyLua)

The [`stylua.toml`](./stylua.toml) file in this repository is just
to set the format options to format my Lua code in the
[Neovim](./nvim/) and [Wezterm](./wezterm/) configuration.
