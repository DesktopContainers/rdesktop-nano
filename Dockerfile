FROM desktopcontainers/base-debian

RUN apt-get -q -y update && \
    apt-get -q -y install rdesktop && \
    apt-get -q -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    \
    su -l -s /bin/sh -c "echo 'rdesktop -x m -g \"\$VNC_SCREEN_RESOLUTION\" -P -D \$RDESKTOP_OPTS \$RDESKTOP_SERVER' | tee /home/app/.xsession" app
    
RUN echo "#!/bin/bash\nrdesktop \$*\n" > /bin/ssh-app.sh
