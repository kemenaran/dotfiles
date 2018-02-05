#!/bin/bash -e
# Symlink dotfiles to their location

DOT_ROOT=$(cd `dirname "$0"`; pwd)

_confirm() {
    confirmed="no"
	local dest_file="$1"

	if [ -e "$dest_file" -o -L "$dest_file" ]
	then
		confirmed="no";
	else
		confirmed="yes";
		return
	fi

	while true; do
		echo "File '$dest_file' already exists."
	    read -p "Do you want to overwrite it with the dotfile? [y/n] " yn
	    case $yn in
	        [Yy]* ) confirmed="yes";  break;;
	        [Nn]* ) confirmed="no"; break;;
	        * ) echo "Please answer yes or no.";;
	    esac
	done
}

_install() {
	local src_file="$1"
	local dest_file="$2"
	if [ "$src_file" -ef "$dest_file" ]; then
		echo "Skipped $dest_file: already installed"
	else
		_confirm "$dest_file"
		if [ "$confirmed" == "yes" ]; then
			[ -e "$dest_file" -o -L "$dest_file" ] && rm "$dest_file"
			ln -s "$src_file" "$dest_file"
			echo "Installed $dest_file"
		fi
	fi
}

_install "$DOT_ROOT/git/gitconfig" "$HOME/.gitconfig"
_install "$DOT_ROOT/git/gitignore" "$HOME/.gitignore"
_install "$DOT_ROOT/shell/profile" "$HOME/.profile"
_install "$DOT_ROOT/sublime-text/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
_install "$DOT_ROOT/sublime-text/Default (OSX).sublime-keymap" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
