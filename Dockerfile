FROM desktopcontainers/base-debian

RUN apt-get -q -y update && \
    apt-get -q -y install rdesktop && \
    apt-get -q -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    \
    echo 'rdesktop -x m -g "$VNC_SCREEN_RESOLUTION" -P -D $RDESKTOP_OPTS $RDESKTOP_SERVER' | tee /etc/X11/Xsession.d/99x12-rdesktop_start

RUN echo "#!/bin/bash\nrdesktop \$*\n" > /bin/ssh-app.sh
