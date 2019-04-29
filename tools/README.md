# Tools

* `alt-icon.sh` – changes the alternative icon you choose;
* `build_color_folders.sh` – generates and creates new folders colors:
* `ffsvg.sh PATH...` – finds, fixes and cleans SVG files;
* `_clean_attrs.sed` – removes unused attributes and removes attributes with default values from elements inside SVG files (part of `ffsvg.sh`);
* `_clean_style_attr.sed` – removes unused properties and removes properties with default values from style attributes inside SVG files (part of `ffsvg.sh`);
* `_fix_color_scheme.sh FILE...` – looks in the SVG files for certain colors and replaces them with the corresponding stylesheet class. Fixes a color scheme after Inkscape (part of `ffsvg.sh`);
* `_scour.sh FILE...` – Scour wrapper (part of `ffsvg.sh`);
* `_svgo.yml` – [SVGO](https://github.com/svg/svgo) coniguration (part of `ffsvg.sh`);
* `update-symlinks-without-overwriting-the-original.sh` – updates the symlinks from the old (original) to new icon, but without overwriting the original icon;
* `update-symlinks-with-overwriting-the-original.sh` – updates the symlinks from the old (original) to new icon, but will overwrite the original icon;


## Useful snippets

Optimize and fix SVG files that are added or modified but not committed (recommended): 

```
git status --porcelain | awk '/A|M/{print $2}' | xargs ./tools/ffsvg.sh
```

Optimize and fix SVG files that are committed in [043906b](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/commit/043906b0edbcc86b732640bc391898d0aaaa410c):

```
git show --name-only 043906b | xargs ./tools/ffsvg.sh
```
