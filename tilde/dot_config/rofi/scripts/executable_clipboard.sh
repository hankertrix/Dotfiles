#!/bin/sh

# The temporary directory to store the images
tmp_dir="/tmp/cliphist"

# Remove the temporary directory
rm -rf "$tmp_dir"

# If the first argument is non zero, immediately copy the history
if [ -n "$1" ]; then
    cliphist decode "$1" | wl-copy
    exit
fi

# Otherwise, make a temporary directory
mkdir -p "$tmp_dir"

# Generate the images from the history
cliphist list | gawk -v tmp_dir="$tmp_dir" '
/^[0-9]+\s<meta http-equiv=/ { next }

{
    if (match($0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp)) {
        file = tmp_dir "/" grp[1] "." grp[3]
        cmd = "echo \"" grp[1] "\t\" | cliphist decode > \"" file "\""
        system(cmd)
        printf "%s\0icon\x1f%s\n", $0, file
        next
    }
    print
}
'
