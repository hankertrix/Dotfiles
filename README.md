# Linux Config Files

The configuration files are located in `~/` or `/home/username/`. The laptop that I currently use is an [ASUS TUF Gaming A16 AMD Advantage Edition](https://www.asus.com/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-advantage-edition-2023/), with a Ryzen 9-7940HS processor, an AMD Radeon RX7600S GPU and a screen resolution of 2560x1600. I am currently using [EndeavourOS](https://endeavouros.com/), which is an [Arch-based](https://archlinux.org/) Linux distribution. I'm using the [i3-wm setup with EndeavourOS](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/).

<br>


## .Xresources

The .Xresources configuration is just to make sure the display works properly with my high DPI screen. I also turned on antialiasing.

<br>

## .xinitrc

The .xinitrc file is just so merge the configuration inside .Xresources into xrdb so that the changes will apply.

<br>

## .profile

The default terminal is set to kitty and the default editor is set to Neovim. I am using kitty as wezterm is just way too slow to start and it's also a little bit buggy. I'm keeping wezterm around though, since it's cross-platform and has a ton of features that kitty doesn't provide.

<br>

