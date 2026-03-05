#!/usr/bin/env bash
set -euo pipefail

git config --global user.name "yash2k4"
git config --global user.email "yash2k4@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global color.ui auto
git config --global core.autocrlf input
git config --global fetch.prune true
git config --global push.autoSetupRemote true
git config --global rerere.enabled true
git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3

git config --global --list
