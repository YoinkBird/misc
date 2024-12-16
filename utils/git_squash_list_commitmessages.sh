#!/usr/bin/env bash
set -x
git log --pretty=format:%s "${@}"
