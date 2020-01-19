<p align="center">
    <img src="images/logo.svg" alt="Logotype">
</p>

<h4 align="center">A third-party Adwaita++ icons for more than 20 distributions </h4>
<h4 align="center">An elegant, flat and modern based on <a href="https://github.com/GNOME/adwaita-icon-theme">Adwaita</a> icons by GNOME Project</h4>

$for(icones)$
  <img alt="$icones.nome$"   name="$icones.nome$"   src="$mais.url$"/>
$endfor$

- [Screenshot](#screenshot)
- [Installation](#installation)
  - [Installing the stable version with CLI](#installing-the-stable-version-with-cli)
    - [ROOT directory (recommended)](#root-directory-recommended)
    - [HOME directory for GTK](#home-directory-for-gtk)
    - [HOME directory for KDE](#home-directory-for-kde)
    - [\*BSD systems](#bsd-systems)
    - [Uninstall](#uninstall)
  - [Installing the beta/dev version with CLI](#installing-the-betadev-version-with-cli)
    - [ROOT directory (recommended)](#root-directory-recommended-1)
    - [HOME directory for GTK](#home-directory-for-gtk-1)
    - [HOME directory for KDE](#home-directory-for-kde-1)
    - [\*BSD systems](#bsd-systems-1)
    - [Uninstall](#uninstall-1)
- [Alternative icons of Firefox](#alternative-icons-of-firefox)
- [Bugs](#bugs)
- [Request](#request)
- [Credits and Licences](#credits-and-licences)

# Screenshot

![Screenshot 1](images/screenshot1.png)
![Screenshot 2](images/screenshot2.png)

# Installation

## Installing the stable version with CLI

Use the scripts to install the latest version directly from this repository (independently of your distribution):

**NOTE:** Use the same command to update the icon theme.

### ROOT directory (recommended)

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | sh
```

### HOME directory for GTK

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | env DESTDIR="$$HOME/.icons" sh
```

### HOME directory for KDE

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | env DESTDIR="$$HOME/.local/share/icons" sh
```

### \*BSD systems

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | env DESTDIR="/usr/local/share/icons" sh
```

### Uninstall

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/master/install.sh | env uninstall=true sh
```

## Installing the beta/dev version with CLI

You will receive daily or weekly the latest commits directly from this repository (independently of your distribution). It is important to observe that the beta version may show some unstability, bugs and broken something. 

**NOTE:** Use the same command to update the icon theme.

### ROOT directory (recommended)

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/beta/install.sh | TAG=beta sh
```

### HOME directory for GTK

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/beta/install.sh | TAG=beta env DESTDIR="$$HOME/.icons" sh
```

### HOME directory for KDE

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/beta/install.sh | TAG=beta env DESTDIR="$$HOME/.local/share/icons" sh
```

### \*BSD systems

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/beta/install.sh | TAG=beta env DESTDIR="/usr/local/share/icons" sh
```

### Uninstall

```
wget -qO- https://raw.githubusercontent.com/Bonandry/adwaita-plus/beta/install.sh | TAG=beta env uninstall=true sh
```

# Alternative icons of Firefox

You can choose of four alternatives icons of Firefox:

<table style="undefined; table-layout: fixed; width: 600px">
  <colgroup>
    <col style="width: 200px">
    <col style="width: 360px">
  </colgroup>
  <tr>
    <th>official icon<br></th>
    <th>alternative icons</th>
  </tr>
  <tr><td rowspan="5">firefox-official.svg</td>
    <td><img   align="middle" height="64px" src="images/firefox/firefox-official.svg"> firefox-official.svg</td>
  </tr>
  <tr><td><img align="middle" height="64px" src="images/firefox/firefox-2018.svg"> firefox-2018.svg</td></tr>
  <tr><td><img align="middle" height="64px" src="images/firefox/firefox-2019-gnome-plus.svg"> firefox-2019-gnome-plus.svg</td></tr>
  <tr><td><img align="middle" height="64px" src="images/firefox/firefox-2019-mozilla.svg"> firefox-2019-mozilla.svg</td></tr>
  <tr><td><img align="middle" height="64px" src="images/firefox/firefox-2019.svg"> firefox-2019.svg</td></tr>
</table>

Run in the terminal:

```zsh
cd Adwaita++/apps/scalable
ln -sfnr <choose-one-of-4-alternatives> firefox.svg

# Revert to the original
ln -sfnr firefox-official.svg firefox.svg
```

# Bugs

Please visit the [wiki about the bugs at Suru++ Ubuntu](https://github.com/Bonandry/suru-plus-ubuntu/wiki)

# Request

Please visit and use [@btd1337](https://github.com/btd1337)'s project [Identify Missing Icons](https://github.com/btd1337/icons-missing-script). 

# Credits and Licences

* LGPL3/CC-BY-SA © <a href="https://github.com/GNOME/adwaita-icon-theme">Adwaita Icons</a> by 2019 GNOME Project.
* GPL3 © [Papirus](https://github.com/PapirusDevelopmentTeam/) by [Alexey Varfolomeev](https://github.com/varlesh).
* GPL3 © 2019 Adwaita++ Ubuntu by Andrea Bonanni and Gustavo Costa.