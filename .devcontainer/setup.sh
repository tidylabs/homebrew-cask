#!/usr/bin/env bash

set -e

: ${GITHUB_REPOSITORY:="tidylabs/homebrew-cask"}
: ${GITHUB_WORKSPACE:=$PWD}

# Install/Update Homebrew (if needed)
if [ ! -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    /home/linuxbrew/.linuxbrew/bin/brew update
fi

# Add Homebrew to path (if needed)
if ! command -v brew 2>&1 >/dev/null; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    if [ -w "$GITHUB_PATH" ]; then
        echo "$HOMEBREW_PREFIX/sbin" >> "$GITHUB_PATH"
        echo "$HOMEBREW_PREFIX/bin" >> "$GITHUB_PATH"
    else 
        echo >> ~/.bashrc
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
    fi
fi

# Set default remote branch
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/master

# Setup tap
tap_dir="$(brew --repo "$GITHUB_REPOSITORY")"
mkdir -vp "${tap_dir%/*}"
ln -vs "$GITHUB_WORKSPACE" "$tap_dir"