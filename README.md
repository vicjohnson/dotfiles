# My Dotfiles and Settings

> This repository is a collection of my settings files.  Some of them make my life a little bit easier, while others are just for fun.

## Installation

Inside this repository is an installation script called `install`.  This script will iterate through all settings files and symbolically link them into your `$HOME` directory.

#### Installation Situations

1. *File already exists:* Any existing files will be left alone and installation will continue with the next files.
2. *File alread exists as a symlink:* Any existing symlinks will be overwritten with links to these settings files.

**Note:** If the `-f` flag is set, the installation will replace any files with the same name, so *BE CAREFUL*.

## Uninstallation

There is also a script in this repository called `uninstall`, surprisingly enough, this removes all symlinks to the settings files.

## Settings info

More details about each setting can be found in the comments of the files.