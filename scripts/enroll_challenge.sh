#!/bin/bash

##	strict mode
set -euo pipefail
IFS=$'\n\t'

##	global vars
DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

##	what challenge is this, and what slot on the yubi key?
COUNT=01
SLOT=2

##	do the work
ykinfo -s -q 1> /dev/null 2> /dev/null && (

	YUBI="$(ykinfo -m -q)"

	###	create challenge
	mkdir -p $CHALLENGES_ROOT/$VAULT_NAME
	CHALLENGE=$CHALLENGES_ROOT/$VAULT_NAME/yubi-${YUBI}.slot-${SLOT}.challenge-${COUNT}.bin
	touch $CHALLENGE
	dd if=/dev/urandom of=$CHALLENGE bs=256 count=3

	###	create LUKS key based on the challenge and yubi's response
	LUKSLOT=$(cryptsetup --verbose luksAddKey --type luks2 $STORAGE_LOCATION <(ykchalresp -${SLOT} -i $CHALLENGE))
	echo $LUKSLOT
	echo "Yubikey $YUBI was challenged with challenge $COUNT and enrolled with YUBI slot $SLOT and LUKS slot $LUKSLOT" >> $DIR/yubi_enrolments.log
	$DIR/is_mounted.sh

) || (
	echo 'shit baby! you need to plug in a yubikey'
)

