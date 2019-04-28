<p align="center">
    <img src="images/logo.svg" alt="Logotype">
</p>

<h4 align="center">A third-party GNOME++ icons for more than 20 distributions </h4>
<h4 align="center">An elegant, flat and modern based on <a href="https://github.com/GNOME/adwaita-icon-theme">Adwaita</a> icons by GNOME Project</h4>

<p align="center">
  <img alt="apps" src="https://img.shields.io/badge/apps_icons-2170%2B-3584e4.svg?style=popout-square&logo=gnome?&colorA=a89888"/>
  <img alt="actions" src="https://img.shields.io/badge/actions_icons-920%2B-3584e4.svg?style=popout-square&logo=gnome?&colorA=a89888"/>
  <img alt="devices" src="https://img.shields.io/badge/devices_icons-80%2B-3584e4.svg?style=popout-square&logo=gnome?&colorA=a89888"/>
  <img alt="mimetypes" src="https://img.shields.io/badge/mimetypes_icons-610%2B-3584e4.svg?style=popout-square&logo=gnome?&colorA=a89888"/>
  <img alt="places" src="https://img.shields.io/badge/places_icons-70%2B-3584e4.svg?style=popout-square&logo=gnome?&colorA=a89888"/>
</p>

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
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | sh
```

### HOME directory for GTK

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | env DESTDIR="$HOME/.icons" sh
```

### HOME directory for KDE

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | env DESTDIR="$HOME/.local/share/icons" sh
```

### \*BSD systems

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | env DESTDIR="/usr/local/share/icons" sh
```

### Uninstall

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | env uninstall=true sh
```

## Installing the beta/dev version with CLI

You will receive daily or weekly the latest commits directly from this repository (independently of your distribution). It is important to observe that the beta version may show some unstability, bugs and broken something. 

**NOTE:** Use the same command to update the icon theme.

### ROOT directory (recommended)

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | TAG=beta sh
```

### HOME directory for GTK

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | TAG=beta env DESTDIR="$HOME/.icons" sh
```

### HOME directory for KDE

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | TAG=beta env DESTDIR="$HOME/.local/share/icons" sh
```

### \*BSD systems

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | TAG=beta env DESTDIR="/usr/local/share/icons" sh
```

### Uninstall

```
wget -qO- https://raw.githubusercontent.com/Bonandry/gnome-plus/master/install.sh | TAG=beta env uninstall=true sh
```
# Bugs

Please visit the [wiki about the bugs at Suru++ Ubuntu](https://github.com/Bonandry/suru-plus-ubuntu/wiki)

# Request

Please visit the [wiki about how to request an icon at Suru++ Ubuntu](https://github.com/Bonandry/suru-plus-ubuntu/wiki/Report)

# Credits and Licences

* LGPL3/CC-BY-SA © <a href="https://github.com/GNOME/adwaita-icon-theme">Adwaita Icons</a> by 2019 GNOME Project
* GPL3 © [Papirus](https://github.com/PapirusDevelopmentTeam/) by [Alexey Varfolomeev](https://github.com/varlesh).
* GPL3 © 2019 GNOME++ Ubuntu by Andrea Bonanni and Gustavo Costa.