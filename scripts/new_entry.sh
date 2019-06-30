#!/bin/bash

DIR="$(dirname $(readlink -f $0))"
source $DIR/vars.sh

$DIR/is_mounted.sh 2> /dev/null && (
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
) || (
	(>&2 echo 	'shit baby! we aint mounted')
)
