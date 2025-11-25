#!/usr/bin/env bash
REPO_DIR=/tmp/hdots
public_key="ml4w-apps-public-key.asc"
public_key_url="https://mylinuxforwork.github.io/ml4w-flatpak-repo/$public_key"
wget $public_key_url /tmp/$public_key
flatpak remote-add --if-not-exists ml4w-repo https://mylinuxforwork.github.io/ml4w-flatpak-repo/ml4w-apps.flatpakrepo --gpg-import=/tmp/$public_key

git clone https://github.com/mylinuxforwork/dotfiles.git $REPO_DIR --single-branch --depth 1
# --------------------------------------------------------------
# Prebuild Packages
# --------------------------------------------------------------
echo "Installing eza v0.23.0"
# https://github.com/eza-community/eza/releases
cp $REPO_DIR/setup/packages/eza /usr/bin
cp $REPO_DIR/setup/packages/matugen /usr/bin

# --------------------------------------------------------------
# Pip
# --------------------------------------------------------------

echo ":: Installing packages with pip"
pip install hyprshade
pip install pywalfox
pywalfox install
pip install screeninfo
pip install waypaper

# --------------------------------------------------------------
# ML4W Apps
# --------------------------------------------------------------

# source $REPO_DIR/setup/_ml4w-apps.sh

# --------------------------------------------------------------
# Flatpaks
# --------------------------------------------------------------

# source $REPO_DIR/setup/_flatpaks.sh

# --------------------------------------------------------------
# Grimblast
# --------------------------------------------------------------
#

# --------------------------------------------------------------
# Cursors
# --------------------------------------------------------------

source $REPO_DIR/setup/_cursors.sh

# --------------------------------------------------------------
# Fonts
# --------------------------------------------------------------

source $REPO_DIR/setup/_fonts.sh

# --------------------------------------------------------------
# Icons
# --------------------------------------------------------------

source $REPO_DIR/setup/_icons.sh
