#!/bin/bash

set -e

: ${BREW:="/home/linuxbrew/.linuxbrew/bin/brew"}
: ${GITHUB_REPOSITORY:="tidylabs/homebrew-cask"}
: ${GITHUB_WORKSPACE:=$PWD}
: ${INSTALL_URL:="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"}

# Create ~/.bashrc.d and ~/.env.d
[ ! -d ~/.bashrc.d ] && mkdir -v ~/.bashrc.d
[ ! -d ~/.env.d ] && mkdir -v ~/.env.d

# Copy ~/.bashrc to ~/.bashrc.d/00-default.bashrc
[ ! -f ~/.bashrc ] && touch ~/.bashrc.d/00-default.bashrc
[ ! -f ~/.bashrc.d/00-default.bashrc ] && \
	mv -vn ~/.bashrc ~/.bashrc.d/00-default.bashrc

# Write ~/.bashrc
cat > ~/.bashrc <<EOF
set -a # automatically export all variables
for f in ~/.env.d/*.env; do
	source "\$f"
done
set +a

for f in ~/.bashrc.d/*.bashrc; do
	source "\$f"
done
EOF

# Create ~/.env.d/homebrew.env
cat > ~/.env.d/homebrew.env <<EOF
HOMEBREW_DEVELOPER=1
HOMEBREW_NO_ANALYTICS=1
HOMEBREW_NO_AUTO_UPDATE=1
HOMEBREW_NO_ENV_HINTS=1
HOMEBREW_SIMULATE_MACOS_ON_LINUX=1
EOF

# Create ~/.bashrc.d/homebrew.bashrc
cat > ~/.bashrc.d/homebrew.bashrc <<EOF
if [ -x "$BREW" ]; then
	eval "\$($BREW shellenv)"
fi
EOF

# Reload ~/.bashrc
source ~/.bashrc

# Install/Update Homebrew
if [ ! -x "$BREW" ]; then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL "$INSTALL_URL")"
	eval "$($BREW shellenv)"
else
	brew update
fi

# Update $GITHUB_ENV
[ -w "$GITHUB_ENV" ] \
	&& for f in ~/.env.d/*.env; do cat < "$f" >> "$GITHUB_ENV"; done

# Update $GITHUB_PATH
[ -w "$GITHUB_PATH" ] \
	&& echo "$PATH" | tr ':' '\n' | grep "$HOMEBREW_PREFIX" >> "$GITHUB_PATH"

# Set default remote branch
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/master

# Setup tap
tap_dir="$(brew --repo "$GITHUB_REPOSITORY")"
[ ! -d "$tap_dir" ] \
	&& mkdir -vp "${tap_dir%/*}" \
	&& ln -vs "$GITHUB_WORKSPACE" "$tap_dir"