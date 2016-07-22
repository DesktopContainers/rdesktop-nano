FROM desktopcontainers/base-debian

RUN apt-get -q -y update && \
    apt-get -q -y install rdesktop && \
    apt-get -q -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

ADD xsession /home/app/.xsession
    
RUN mkdir /home/app/.vnc && \
    touch /home/app/.vnc/rdesktop.log; \
    chown app.app -R /home/app/.xsession /home/app/.vnc; \
    echo "#!/bin/bash\nrdesktop \$*\n" > /bin/ssh-app.sh
