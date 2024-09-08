# Yazi configuration files

## [`keymap.toml`](https://yazi-rs.github.io/docs/configuration/keymap)
For the most part, the `keymap.toml` file just includes
most of the `lf` key binds so that both Yazi and `lf` will behave similarly.

A lot of the keybinds use my own plugin called
[`augment-command.yazi`](https://github.com/hankertrix/augment-command.yazi)
to improve a lot of the default Yazi commands, like auto-skipping directories
with only one subdirectory, like GitHub does, automatically extracting and entering
archive files, and smartly determining an item group to operate on for a few commands.
You can find more information about the plugin
[here](https://github.com/hankertrix/augment-command.yazi).

## [`theme.toml`](https://yazi-rs.github.io/docs/configuration/theme)
The `theme.toml` file is mostly to make the icons and colours the same as the `lf` configuration,
as well as to fix the weird colours in the help menu and the file manager.
The help menu colours were awful with the [Bluloco Dark theme](https://github.com/uloco/bluloco.nvim).

The syntax highlighting in Yazi is configured by using a [bat](https://github.com/sharkdp/bat)
syntax highlighting file.
The Bluloco theme that I use for syntax highlighting can be found in
[@uloco's dot files](https://github.com/uloco/dotfiles), specifically:

- [Bluloco Dark](https://github.com/uloco/dotfiles/blob/main/bat/.config/bat/themes/bluloco-dark/bluloco-dark.tmTheme)
- [Bluloco Light](https://github.com/uloco/dotfiles/blob/main/bat/.config/bat/themes/bluloco-light/bluloco-light.tmTheme)

## [`yazi.toml`](https://yazi-rs.github.io/docs/configuration/yazi)
The `yazi.toml` file is mostly just to make Yazi work similarly to the `lf` configuration.
The image previews in Yazi are pretty small by default,
so the configuration also increases the maximum size to a rather absurd number,
so the previews will use all the available space in the preview pane,
which is the same as the configuration for `lf`.

## `yy.sh`
This file is very similar to the `lfcd.sh` file in the `lf` configuration,
it just adds the `yy` command which changes the directory
to the current directory Yazi is in when Yazi exits.
