#!/bin/sh

# Script to sync dotfiles

# Sync the dotfiles with the tilde directory
stow -vR -t ~ tilde
