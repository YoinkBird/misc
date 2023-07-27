#!/usr/bin/env bash
set -x
git init 
touch .gitignore
git add .gitignore
git commit -m "init repo"
git log -n 1 --name-only
