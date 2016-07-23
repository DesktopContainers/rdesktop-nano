#!/bin/bash
if [ -z ${RDESKTOP_KEEP_ALIVE+x} ]; then
    rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D \
             $RDESKTOP_OPTS $RDESKTOP_SERVER \
             &>> /home/app/.vnc/rdesktop.log
else
    while true; do
        rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D \
                 $RDESKTOP_OPTS $RDESKTOP_SERVER \
                 &>> /home/app/.vnc/rdesktop.log;
        sleep 1
    done
fi
sleep 5
kill -9 $(ps x | grep 'tail -F' | head -n1 | awk '{print $1}')
