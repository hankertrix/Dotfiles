# Linux Config Files

The configuration files are located in `~/` or `/home/username/`.
The laptop that I currently use is an
[ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/),
with a Ryzen 9-7940HS processor, an AMD Radeon RX7600S GPU and a screen resolution of 2560x1600.
I am currently using [EndeavourOS](https://endeavouros.com/),
which is an [Arch-based](https://archlinux.org/) Linux distribution.
I'm using the [i3-wm setup with EndeavourOS](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/).

## .config folder
The `.config` folder is where the configuration for the applications I use on Linux are located.
There is a README inside that briefly explains the configuration for the various applications inside.

## .mozilla folder
The `.mozilla` folder is just to store my overrides for [arkenfox user.js](https://github.com/arkenfox/user.js).

## .Xresources
The .Xresources configuration is just to make sure the display works properly with my high DPI screen.
I also turned on antialiasing.

## .bashrc
The `.bashrc` file is mostly just the default EndeavourOS configuration, with an if statement added in so that I can change the shell's directory when using `lf`.

## .profile
This file is just to set the default applications for various tasks.
The default terminal is set to kitty,
the default editor is set to Neovim,
the default browser is set to Firefox and
the default pager is set to less.

## .xinitrc
The .xinitrc file is just so merge the configuration inside .Xresources into xrdb so that the changes will apply.
