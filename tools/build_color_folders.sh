#!/usr/bin/env bash
# This script creates colored folder icons for Suru+ icon theme
#
# Colors of the folder icon:
#
#   @ - primary color
#	" - secondary color
#	. - color of symbol
#
#     """""""""""""""""
#    """"""""""""""""""""
#    """"""""""""""""""""""""""""""""""""""""
#    """"""""""""""""""""""""""""""""""""""""
#    """"""""""""""""""""@@@@@@@@@@@@@@@@@@@"
#    """"""""""""""""""@@@@@@@@@@@@@@@@@@@@@@
#    .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@....@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@.@@.@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@.@@.@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@.@@.@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@......@@......@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@.@@@@@@@@@@.@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@.@@@@@@@@.@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@..@@..@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@@..@@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@............@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

set -eo pipefail

THIS_SCRIPT="$(basename "${BASH_SOURCE[0]}")"

if [ -d "$1" ]; then
	TARGET_DIR="$1"
else
	printf "%s\n" "usage: $THIS_SCRIPT <path to icon theme>" >&2
	exit 128
fi

DEFAULT_COLOR="adwaita"
SIZES_REGEX="(16|scalable)"
MONOCHROME_SIZES_REGEX="(16)"
COLOR_SIZES_REGEX="(scalable)"
FILES_REGEX="(folder|user)-"

declare -A COLORS

COLORS=(
	# [0] - primary color
	# [1] - secondary color
	# [2] - color of symbol
	#
	# | name      | [0]   | [1]   | [2]   |
	# |-----------|-------|-------|-------|
	# official Adwaita colours
	[adwaita]="    #c9b8a7 #a89888 #908478"
	[blue]="       #62a0ea #3584e4 #1c71d8"
	[brown]="      #b5835a #986a44 #63452c"
	[green]="      #57e389 #33d17a #2ec27e"
	[grey]="       #c0bfbc #9a9996 #77767b"
	[orange]="     #ffa348 #ff7800 #e66100"
	[red]="        #f66151 #ed333b #a51d2d"
	[purple]="     #8f76e4 #7839b7 #d7cff5"
	[yellow]="     #f8e45c #f6d32d #e5a50a"
	# unofficial colours
	[aubergine]="  #a0649a #4f1748 #ddc8db"
	[black]="      #1a1a1a #333333 #aeaeae"
	[bluegrey]="   #78909c #455a64 #cfd8dc"
	[bordeaux]="   #c2655b #7f372f #edd3d0"
	[canonical]="  #853e64 #4c1a35 #ddcad4"
	[indigo]="     #5c6bc0 #3f51b5 #b6bde3"
	[manjaro]="    #16a085 #12816b #a6dbd1"
	[mint]="       #7aaf65 #579140 #d0e3c9"
	[white]="      #ececec #b3b3b3 #4c5561"
	[yaru]="       #444444 #f6454c #bebebe"
	[custom]="     #value_light #value_dark #323232"
)


headline() {
	printf "%b => %b%s\n" "\e[1;32m" "\e[0m" "$*" >&2
}

msg() {
	printf "%b [+] %b%s\n" "\e[1;33m" "\e[0m" "$*" >&2
}

recolor() {
	# args: <old colors> <new colors> <path to file>
	IFS=" " read -ra old_colors <<< "$1"
	IFS=" " read -ra new_colors <<< "$2"
	local filepath="$3"

	[ -f "$filepath" ] || exit 1

	for (( i = 0; i < "${#old_colors[@]}"; i++ )); do
		sed -i "s/${old_colors[$i]}/${new_colors[$i]}/gI" "$filepath"
	done
}

headline "PHASE 1: Delete color suffix from monochrome icons ..."
# -----------------------------------------------------------------------------
find "$TARGET_DIR" -regextype posix-extended \
	-regex ".*/places/${MONOCHROME_SIZES_REGEX}/${FILES_REGEX}${DEFAULT_COLOR}-.*" \
	-print0 | while read -r -d $'\0' file; do

	new_file="${file/-$DEFAULT_COLOR-/-}"

	msg "'$file' is renamed to '$new_file'"
	mv -f "$file" "$new_file"
done


headline "PHASE 2: Create missing symlinks ..."
# -----------------------------------------------------------------------------
find "$TARGET_DIR" -type f -regextype posix-extended \
	-regex ".*/places/${COLOR_SIZES_REGEX}/${FILES_REGEX}${DEFAULT_COLOR}[-\.].*" \
	-print0 | while read -r -d $'\0' file; do

	target="$(basename "$file")"
	symlink="${file/-$DEFAULT_COLOR/}"

	[ -e "$symlink" ] && continue

	msg "Creating missing symlink '$symlink' ..."
	ln -sf "$target" "$symlink"
done


headline "PHASE 3: Generate color folders ..."
# -----------------------------------------------------------------------------
find "$TARGET_DIR" -type f -regextype posix-extended \
	-regex ".*/places/${SIZES_REGEX}/${FILES_REGEX}${DEFAULT_COLOR}[-\.].*" \
	-print0 | while read -r -d $'\0' file; do

	for color in "${!COLORS[@]}"; do
		[[ "$color" != "$DEFAULT_COLOR" ]] || continue

		new_file="${file/-$DEFAULT_COLOR/-$color}"

		cp -P --remove-destination "$file" "$new_file"
		recolor "${COLORS[$DEFAULT_COLOR]}" "${COLORS[$color]}" "$new_file"
	done
done


headline "PHASE 4: Create symlinks for Folder Color v0.0.80 and newer ..."
# -----------------------------------------------------------------------------
# Icons mapping
FOLDER_COLOR_MAP=(
	# Folder Color icon         | Suru-plus icon
	# --------------------------|---------------------------
	"folder-COLOR-desktop.svg    user-COLOR-desktop.svg"
	"folder-COLOR-downloads.svg  folder-COLOR-download.svg"
	"folder-COLOR-public.svg     folder-COLOR-image-people.svg"
	"folder-COLOR-videos.svg     folder-COLOR-video.svg"
)

for mask in "${FOLDER_COLOR_MAP[@]}"; do
	for color in "${!COLORS[@]}"; do
		IFS=" " read -ra icon_mask <<< "$mask"
		folder_color_icon="${icon_mask[0]/COLOR/$color}"
		icon="${icon_mask[1]/COLOR/$color}"

		find "$TARGET_DIR" -regextype posix-extended \
			-regex ".*/places/${SIZES_REGEX}/${icon}" \
			-print0 | while read -r -d $'\0' file; do

			base_name="$(basename "$file")"
			dir_name="$(dirname "$file")"

			ln -sf "$base_name" "$dir_name/$folder_color_icon"
		done
	done
done
