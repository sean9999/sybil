#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

ykinfo -a | column -t

NICK=$(ykinfo -q -m)

echo
echo "Challenges for this key"
ls ${CHALLENGES_ROOT}/${VAULT_NAME}/*${NICK}* 2> /dev/null || echo "none :( You must enrol this key"
