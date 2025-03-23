# lf configuration files

## `lfrc`
The `lfrc` file adds a few features to `lf`, listed below:

* File previewing using [ctpv](https://github.com/NikitaIvanovV/ctpv)
* Bulk renaming using [vimv](https://github.com/dmulholl/vimv)
* Creating files
* Making directories
* Moving around in the parent directory with J and K
* Extracting archives
* Copying the absolute file paths, directory names, file names and file names without extensions to the clipboard
* Going to various directories quickly using the g key
* Editing the configuration file using `ec` and going to the configuration directory using `ed`
* Warning about nested instances

## Colours
The `colors` file is to set the colours used in `lf`.

## Icons
The `icons` file is to set the icons used in `lf`.
All the icons used are [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts),
so a [patched font](https://www.nerdfonts.com/font-downloads) is needed.

## `lfcd.sh` file
This is just a file to create a new command called `lfcd` which is just `lf`,
but it changes the directory when `lf` exits.

## External programs
* [ctpv](https://github.com/NikitaIvanovV/ctpv)
* [vimv](https://github.com/dmulholl/vimv)
* [xclip](https://github.com/astrand/xclip)
