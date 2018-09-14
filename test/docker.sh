#!/bin/sh

set -ex

DELAY=15

# goss tests
GOSS_SLEEP=$DELAY GOSS_FILES_PATH=docker dgoss run smartz-wiki:latest
