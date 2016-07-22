#!/bin/bash
/bin/bash -c 'sleep 3; while true; do rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER; done' &
