#!/bin/sh

# Script to sync dotfiles

# Sync the dotfiles for the home directory
stow -vR -t ~ home
