#!/usr/bin/env bash
# Based on:
# REFS: https://github.com/Diolinux/pop-os-postinstall/blob/main/pop-os-postinstall.sh
#
# ---------------------------------------------------------------------------- #
# -------------------------------- VARIABLES --------------------------------- #

# Setting variables per line
set -e

# Directories
dotf_dir="$HOME/xot"
zsh_dir="$HOME/xsh"

# Repositories
dotf_url=https://github.com/compiledge/dotfiles

# Zsh Dirs and Repositories
zsh_dir_list=(
	zsh-vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
	powerlevel10k
)
zsh_url_list=(
	https://github.com/jeffreytse/zsh-vi-mode
	https://github.com/zsh-users/zsh-autosuggestions
	https://github.com/zsh-users/zsh-syntax-highlighting
	https://github.com/romkatv/powerlevel10k
)

# Text color
red='\e[1;91m'   # Bad color
green='\e[1;92m' # Good color
brown='\e[1;33m' # Alert color
fore='\e[0m'     # Foreground color

# Target packages (Debian 12)
deb_list=(

	# Desktop
	awesome            # Highly configurable X window manager
	picom              # Lightweight compositor for X11
	arandr             # Simple visual front end for XRandR
	xinput             # Runtime configuration and test of XInput devices
	volumeicon-alsa    # Systray volume icon for alsa
	nitrogen           # Wallpaper browser and changing utility for X
	pavucontrol        # PulseAudio Volume Control
	brightnessctl      # Control backlight brightness
	lxappearance       # LXDE GTK+ theme switcher
	rofi               # Window switcher, run dialog and dmenu replacement
	papirus-icon-theme # Papirus open source icon theme for Linux
	# i3lock-color (via git)

	# Development
	git                 # Fast, scalable, distributed revision control system
	vim                 # Vi IMproved - enhanced vi editor
	zsh                 # Shell with lots of features
	zoxide              # Faster way to navigate your filesystem
	gh                  # GitHub CLI, GitHub’s official command line tool
	gitk                # Fast, scalable, distributed revision control system
	gitg                # Git repository viewer
	pip                 # Checker for missing and extra packages in Python requirements
	cmake               # Cross-platform, open-source make system
	universal-ctags     # Build tag file indexes of source code definitions
	gdb                 # GNU Debugger
	cgdb                # Curses-based interface to the GNU Debugger (GDB)
	ddd                 # The Data Display Debugger, a graphical debugger frontend
	valgrind            # Instrumentation framework for building dynamic analysis tools
	btop                # Modern and colorful command line resource monitor
	htop                # Interactive processes viewer
	bat                 # Clone with syntax highlighting and git integration
	asciinema           # Record and share your terminal sessions, the right way
	exa                 # Modern replacement for ls
	figlet              # Make large character ASCII banners out of ordinary text
	hugo                # Fast and flexible Static Site Generator written in Go
	adb                 # Android Debug Bridge
	qtcreator           # Integrated development environment (IDE) for Qt
	glade               # GTK+ User Interface Builder
	latexmk             # Perl script for running LaTeX the correct number of times
	texlive             # TeX Live: A decent selection of the TeX Live packages
	texlive-fonts-extra # TeX Live: Additional fonts
	texlive-full        # TeX Live: metapackage pulling in all components of TeX Live
	pandoc              # General markup converter
	ditaa               # Convert ASCII diagrams into proper bitmap graphics
	stow                # Organizer for /usr/local software packages
	lxc                 # Linux Containers userspace tools
	ripgrep             # Recursively searches directories for a regex pattern
	virt-manager        #	Desktop application for managing virtual machines
	trash-cli           # Command line trashcan utility
	npm                 # Package manager for Node.js
	kturtle             # Educational programming environment
	build-essential     # Informational list of build-essential packages
	dict                # Dictionary client
	cpu-x               # Tool that gathers information on CPU, motherboard and more
	ncall               # Terminal Calendar

	# Media
	gimp      # GNU Image Manipulation Program
	inkscape  #	Vector-based drawing program
	darktable # Virtual lighttable and darkroom for photographers
	# krita #
	rawtherapee # Raw image converter and digital photo processor
	mpv         # Video player based on MPlayer/mplayer2
	vlc         # Multimedia player and streamer
	newsboat    # Text mode rss feed reader with podcast support
	cava        # Console-based Audio Visualizer for Alsa
	cmus        # Lightweight ncurses audio player
	ranger      # Console File Manager with VI Key Bindings
	highlight   # Universal source code to formatted text converter
	zathura     # Document viewer with a minimalistic interface
	obs-studio  # Recorder and streamer for live video content
	flameshot   # Powerful yet simple-to-use screenshot software
	gromit-mpx  # GTK+ based tool to make annotations on screen with multiple pointers
	baobab      # GNOME disk usage analyzer
	calibre     # Powerful and easy to use e-book manager
	sweethome3d # Interior 2D design application with 3D preview
	kdenlive    # Non-linear video editor
	xournalpp   # Note-taking program supporting pen & PDF annotation
	scribus     # Open Source Desktop Page Layout - stable branch
	audacity    # Fast, cross-platform audio editor
	blender     # Very fast and versatile 3D modeller/renderer
	bleachbit   # Delete unnecessary files from the system
	okular      # Universal document viewer
	copyq       # Advanced clipboard manager with editing and scripting feature
	gpodder     # Podcast client and feed aggregator
	exfalso     # Audio tag editor for GTK+
	keepassx    # Cross Platform Password Manager
	syncthing   # Decentralized file synchronization
	clamav      # Anti-virus utility for Unix - command-line interface
	clamtk      # Graphical front-end for ClamAV
	flatpak     # Application deployment framework for desktop apps
	timeshift   # System restore utility
	luckybackup # Rsync-based GUI data backup utility
	freeplane   # Java program for working with Mind Maps
	aegisub     # Advanced subtitle editor
	ghostwriter # Distraction-free, themeable Markdown editor
	peek        # Simple animated GIF screen recorder with GUI
	screenkey   # Screencast tool to display your keystrokes
	chiaki      # PlayStation remote play client
	dolphin-emu # Gamecube and Wii emulator
	displaycal  # Graphical user interface for the Argyll CMS
	yt-dlp      # Downloader of videos from YouTube and other sites

	# Network
	firefox   # Web browser
	chromium  # Web browser
	nmap      # The Network Mapper
	wireshark # Network traffic analyzer - meta-package
	filezilla # Full-featured graphical FTP/FTPS/SFTP client

	# Ricing
	neofetch  # Shows Linux System Information with Distribution Logo
	conky     # Highly configurable system monitor
	tty-clock # Simple terminal clock
	cbonsai   # Terminal-based bonsai tree generator
	pipes-sh  # Animated pipes terminal screensaver
	cowsay    # Configurable talking cow
	oneko     # Cat chases the cursor (now a mouse) around the screen
	lolcat    # Colorful `cat`
	cmatrix   # Simulates the display from "The Matrix"
)

# ---------------------------------------------------------------------------- #
# -------------------------------- TESTS --------------------------------- #

# Internet conectando?
verify_connection() {
	if ! ping -c 1 8.8.8.8 -q &>/dev/null; then
		echo -e "${red}[ERROR]: Computer disconnected to the Internet!${fore}"
		exit 1
	else
		echo -e "${green}[INFO]: Computer connected to the Internet!${fore}"
	fi
}

# ---------------------------------------------------------------------------- #
# -------------------------------- FUNCTIONS --------------------------------- #

# Update and upgrade the system (Debian like)
apt_update() {
	sudo apt update && sudo apt dist-upgrade -y
}

# Install the debian packages by apt
install_debs() {

	echo -e "${green}[INFO]: Installing packages by apt-get${fore}"

	for package in "${deb_list[@]}"; do

		# Install when the package isn't installed
		if ! dpkg -l | grep -q "$package"; then
			echo -e "${brown}[INSTALLING]: $package${fore}"
			sudo apt install "$package" -y
		else
			echo "[INSTALLED]: $package"
		fi
	done

}

# The git package is installed?
check_git() {

	if ! dpkg -l | grep -q "git"; then
		exit
	fi
}

# Cloning the dotfiles
get_dot_files() {

	# Need git in this function
	check_git

	# Installling the dotfiles
	if ! test -d "${dotf_dir}"; then
		echo -e "${brown}[INSTALLING]: Dotfiles${fore}"
		git clone ${dotf_url} "${dotf_dir}"
	else
		echo -e "${brown}[FETCHING]: Dotfiles${fore}"
		git fetch "${dotf_dir}"
	fi

	# Linking the configuration with gnu stow
	# stow -R ${dotf_dir} -t ${zsh_dir}
	# stow -R -d /home/eduardo/xot/ . -t /home/eduardo/xsh/
}

# Cloning zsh plugins
get_zsh_plugins() {

	# Need git in this function
	check_git

	# Installing Zsh plugin
	for p in "${!zsh_dir_list[@]}"; do

		# Install when the plugin isn't installed
		# Or Upgrade the target plugin
		if ! test -d "${zsh_dir}/${zsh_dir_list[$p]}"; then

			echo -e "${brown}[INSTALLING]: ${zsh_dir_list[$p]}${fore}"
			git clone "${zsh_url_list[$p]}" "${zsh_dir}"/"${zsh_dir_list[$p]}"

		else
			echo -e "${brown}[FETCHING]: ${zsh_dir_list[$p]}${fore}"
			git fetch "${zsh_dir}"/"${zsh_dir_list[$p]}"
		fi
	done

}

#
system_clean() {
	apt_update -y
}

bye_bye() {
	echo -e "${green}[INFO]: Installation completed!${fore}"
}

# ---------------------------------------------------------------------------- #
# -------------------------------- EXECUTION --------------------------------- #
verify_connection
apt_update
install_debs
# TODO: Integrate the git repositories
# get_dot_files
# get_zsh_plugins
# system_clean
bye_bye
