# Linux Config Files

The configuration files are located in `~/.config/`. The laptop that I currently use is an [ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/), with a Ryzen 9-7940HS processor, a AMD Radeon RX7600S GPU and a screen resolution of 2560x1600. I am currently using [EndeavourOS](https://endeavouros.com/), which is an [Arch-based](https://archlinux.org/) Linux distribution. I'm using the [i3-wm setup with EndeavourOS](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/).

<br>

## [i3](https://i3wm.org/)

The i3 configuration is for the most part, the default configuration from EndeavourOS. There are only a few changes in the `i3/config` file to change the background, the terminal and the default utility to adjust the screen brightness. I also changed some of the scripts and the workspace icons so that they look better on my laptop, which is mostly just adding spaces and thin spaces so that the icons have sufficient space away from the text and don't overlap with the text.

<br>

## [Rofi](https://github.com/davatorium/rofi)

The rofi configuration, like the i3 configuration, is for the mostly just the default configuration from EndeavourOS. There are a few changes to the theme files to make them look better, as the default theme files end up making the windows too small for the entire text display.

<br>

## [Neovim](https://neovim.io/)

There is a README.md file inside the `nvim` folder that lists all of the plugins I use.

<br>

## [Wezterm](https://wezfurlong.org/wezterm/index.html)

For the most part, the wezterm configuration is just adding the Bluloco Light and Bluloco Dark colour scheme and setting the default colour scheme to Bluloco Dark. The default font has also been changed to use the [Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).

<br>

## [Kitty](https://sw.kovidgoyal.net/kitty/)

Similarly, the kitty configuration is mostly just adding the Bluloco Dark colour scheme to kitty and changing the default font to [Cascadia Code Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode). The auto update function for kitty has also been disabled. Kitty is currently my default terminal as wezterm is just way too slow and a bit buggy.
