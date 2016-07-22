FROM desktopcontainers/base-debian

RUN apt-get -q -y update && \
    apt-get -q -y install rdesktop && \
    apt-get -q -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "#!/bin/bash\nrdesktop \$*\n" > /bin/ssh-app.sh
