# rdesktop nano
_rdesktop nano_

small rdesktop Docker container for perfect use with a Terminal Server.

It's based on __DesktopContainers/base-debian__

## Usage: Run the Client

it uses the same screen resolution as the underlying vnc server

# Environment variables and defaults

* __RDESKTOP\_SERVER__
 * set this to rdp server address
* __RDESKTOP\_OPTS__
 * default not set use this to set the options for rdesktop. see command line options of rdesktop
* __RDESKTOP\_KEEP\_ALIVE__
 * set this to any value e.g. true to enable reconnections after rdesktop dies, quits etc.


### Simple SSH X11 Forwarding

Since it is an X11 GUI software, usage is in two steps:
  1. Run a background container as server or start existing one.

        docker start rdesktop-nano || docker run -d --name rdesktop-nano -e 'RDESKTOP_OPTS=-k de -d MYDOMAIN -u johndoe' -e 'RDESKTOP_SERVER=172.10.1.1' desktopcontainers/rdesktop-nano
        
  2. Connect to the server using `ssh -X` (as many times you want). 
     _Logging in with `ssh` automatically opens a rdesktop window_

        ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
        -X app@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' rdesktop-nano)
