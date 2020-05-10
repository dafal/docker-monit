#!/bin/sh 

/usr/bin/curl -s --form-string "token=$PUSHOVER_TOKEN" \
	--form-string "user=$PUSHOVER_USER" \
	--form-string "message=[$MONIT_HOST] $MONIT_SERVICE - $MONIT_DESCRIPTION" \
	--form-string "priority=$1" \
	--form-string "sound=siren" \
https://api.pushover.net/1/messages.jsonop