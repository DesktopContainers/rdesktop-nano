#!/bin/bash
if [ -z ${RDESKTOP_KEEP_ALIVE+x} ]; then
    rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER &>> /home/app/.vnc/rdesktop.log
else
    /bin/bash -c 'while true; do rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER &>> /home/app/.vnc/rdesktop.log; done' &
fi
sleep 5
sudo kill -9 $(ps ax | grep [s]u | grep [t]ail | awk "{print \$1}")
