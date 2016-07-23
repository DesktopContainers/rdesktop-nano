#!/bin/bash
if [ -z ${RDESKTOP_KEEP_ALIVE+x} ]; then
    /bin/bash -c 'rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER &>> /home/app/.vnc/rdesktop.log' &
else
    /bin/bash -c 'while true; do rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER &>> /home/app/.vnc/rdesktop.log; done' &
fi
kill $(ps aux | grep -v entrypoint | grep '[r]desktop.log' | awk '{print $2}')
