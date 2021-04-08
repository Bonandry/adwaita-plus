#! /bin/bash

adwaita_original="/usr/share/icons/Adwaita"
adwaita_plus="/home/gusbemacbe/GitHub/Andrea/adwaita-plus-beta/Adwaita++-Minimal"

# map the Adwaita sizes to Adwaita++ sizes
declare -A size_mapping=([16x16]=16 [24x24]=24 [32x32]=32 [48x48]=48 [scalable]=symbolic)
declare -a directories=(actions apps devices emblems mimetypes places status)

for size in "${!size_mapping[@]}"
do
    for dir in "${directories[@]}"
    do
        for i in "$adwaita_original/$size/$dir/"*.{png,svg}
        do
            # Take just the filename ${i##*/} and build the new path
            plus_file=$adwaita_plus/$dir/${size_mapping["$size"]}/${i##*/}
            if [[ $plus_file = *.png ]]
            then
                # replce the extension with svg
                plus_file=${plus_file%.png}.svg
            fi
            [[ -f "$plus_file" ]] && rm -i -rf "$plus_file"
        done
    done
done