#!/bin/sh

set -ex

if [ ${LOCAL_ACTION_FILE} ]; then
  echo ${LOCAL_ACTION_FILE} > action_file.yml
fi
exit 1

# Add curator as command if needed
if [ "$(echo $1 | cut -c1-1)" = '-' ]; then
  set -- curator "$@"
fi

if [ "$1" = 'curator' ]; then
    while true; do 
      curator --config config.yml action_file.yml

      echo
      echo "Now sleep for ${INTERVAL_IN_HOURS} hours"
      sleep $(( 60*60*INTERVAL_IN_HOURS )); 
    done
fi

# As argument is not related to curator,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
