#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

ZTAMP=$(date '+%Y-%m-%d-%H-%M-%S-%N')
ZUNIX=$(date '+%s')
FRAMP=$(date '+%A, %B %d, %Y')

FYLE=$DIARY_ROOT/$ZTAMP.md

touch $FYLE

echo '---' >> $FYLE
echo 'app:' >> $FYLE
echo "  name: $APP_NAME" >> $FYLE
echo "  version: $APP_VERSION" >> $FYLE
echo "time: $ZUNIX" >> $FYLE
echo '---' >> $FYLE
echo >> $FYLE
echo '# '$FRAMP >> $FYLE
echo >> $FYLE

fastedit $FYLE
