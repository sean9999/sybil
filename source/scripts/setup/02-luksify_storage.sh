#!/bin/bash

##	strict mode
set -euo pipefail
IFS=$'\n\t'

##	global vars
DIR="$(dirname $(readlink -f $0))"
source $DIR/../vars.sh

##	sanity assurance
###	@todo: make sure the file exists and barf if not

##	do the work
cryptsetup luksFormat --type luks2 $STORAGE_LOCATION

##	show the results
cryptsetup luksDump $STORAGE_LOCATION
