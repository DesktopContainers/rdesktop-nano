# rdesktop nano

small rdesktop Docker container for perfect use with a Terminal Server.

## Usage: Run the Client

### Simple SSH X11 Forwarding

Since it is an X11 GUI software, usage is in two steps:
  1. Run a background container as server or start existing one.

        docker start rdesktop-nano || docker run -d --name rdesktop-nano desktopcontainers/rdesktop-nano
        
  2. Connect to the server using `ssh -X` (as many times you want). 
     _Logging in with `ssh` automatically opens a rdesktop window_

        ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
        -X app@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' rdesktop-nano)
