# Yazi configuration files

## [`keymap.toml`](https://yazi-rs.github.io/docs/configuration/keymap)

For the most part, the `keymap.toml` file just includes
most of the `lf` key binds so that both Yazi and `lf` will behave similarly.

A lot of the key binds use my own plugin called
[`augment-command.yazi`](https://github.com/hankertrix/augment-command.yazi)
to improve a lot of the default Yazi commands, like auto-skipping directories
with only one subdirectory, like GitHub does, automatically extracting and
entering archive files, and smartly determining an item group to operate on
for a few commands.
You can find more information about the plugin
[here](https://github.com/hankertrix/augment-command.yazi).

There are also some key binds for the
[`relative-motions.yazi`](https://github.com/dedukun/relative-motions.yazi),
which are just the default key binds that you can find on the
[`README.md`](https://github.com/dedukun/relative-motions.yazi/blob/main/README.md#configuration)
of the plugin.

## [`theme.toml`](https://yazi-rs.github.io/docs/configuration/theme)

The `theme.toml` file is mostly to set the theme, notification icons,
and remove the border symbols.
The [flavours](https://yazi-rs.github.io/docs/flavors/overview/)
that I use can be found in the [`flavors`](./flavors/) folder,
which is just a port of the [Bluloco](https://github.com/uloco/bluloco.nvim)
to Yazi.

The syntax highlighting in Yazi is configured by using a
[bat](https://github.com/sharkdp/bat) syntax highlighting file,
which is set in the flavour, but you can also configure it manually.
The Bluloco theme that I use for syntax highlighting can be found in
[@uloco's dot files](https://github.com/uloco/dotfiles), specifically:

- [Bluloco Dark](https://github.com/uloco/dotfiles/blob/main/bat/.config/bat/themes/bluloco-dark/bluloco-dark.tmTheme)
- [Bluloco Light](https://github.com/uloco/dotfiles/blob/main/bat/.config/bat/themes/bluloco-light/bluloco-light.tmTheme)

## [`yazi.toml`](https://yazi-rs.github.io/docs/configuration/yazi)

The `yazi.toml` file is mostly just to make Yazi work
similarly to the `lf` configuration.
The image previews in Yazi are pretty small by default,
so the configuration also increases the maximum size to a rather absurd number,
so the previews will use all the available space in the preview pane,
which is the same as the configuration for `lf`.
There are also additional openers to open `.org` and `.tex` files in
[Emacs](https://www.gnu.org/software/emacs/) and all audio and video streams
in [Spek](https://github.com/alexkay/spek) for spectrum analysis.

## [`init.lua`](https://yazi-rs.github.io/docs/plugins/overview/#sync-vs-async)

The `init.lua` file is to configure the plugins that I use for Yazi.
Currently, I only need to configure the
[`relative-motions.yazi`](https://github.com/dedukun/relative-motions.yazi)
plugin, as I use the default options for my own
[`augment-command.yazi`](https://github.com/hankertrix/augment-command.yazi)
plugin.

## [`yy.sh`](https://yazi-rs.github.io/docs/quick-start/#shell-wrapper)

This file is very similar to the `lfcd.sh` file in the `lf` configuration,
it just adds the `yy` command which changes the directory
to the current directory Yazi is in when Yazi exits.

## [`package.toml`](./package.toml)

The `package.toml` file just tells Yazi what Yazi plugins I use,
and it is generated when you add a Yazi plugin using the
`ya pack -a` command.
