# rdesktop nano
_rdesktop nano_

small rdesktop Docker container for perfect use with a Terminal Server.

It's based on __debian:bullseye__

## Changelogs

* 2023-03-20
    * github action to build container
    * implemented ghcr.io as new registry
    * upgrade from `jessie` to `bullseye`

## Usage: Run the Client

it uses the same screen resolution as the underlying vnc server

# Environment variables and defaults

* __RDESKTOP\_SERVER__
 * set this to rdp server address
* __RDESKTOP\_OPTS__
 * default not set use this to set the options for rdesktop. see command line options of rdesktop
* __RDESKTOP\_KEEP\_ALIVE__
 * set this to any value e.g. true to enable reconnections after rdesktop dies, quits etc.

* __DISABLE\_SSHD__
 * set this to any value e.g. true to disable SSHD -> Port 22
  * _ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -X root@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' containername) [...]_
* __DISABLE\_VNC__
 * set this to any value e.g. true to disable VNC Server -> Port 5901
* __VNC\_PASSWORD__
 * default: _debian_ use custom password for VNC
* __VNC\_SCREEN\_RESOLUTION__
 * default: _1280x800_
* __DISABLE\_WEBSOCKIFY__
 * set this to any value e.g. true to disable Websockify Server -> Port 80

## Websockify SSL Environment variables and defaults

* __ENABLE\_SSL__
 * set this to any value e.g. true to enable to enable SSL Websockify Server
* __SSL\_ONLY__
 * set this to any value e.g. true to set SSL only for Websockify Server
* __SSL\_CERT__
 * default: _/opt/websockify/self.pem_ path to cert with included key
* __SSL\_SIZE__
 * default: _4086_ keysize
* __SSL\_DAYS__
 * default: _3650_ ssl cert lifetime in days
* __SSL\_SUBJECT__
 * default: _/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost_ ssl cert subject

## Proxy Environment variables and defaults

* __HTTP\_PROXY__
 * set this to a value like 'http://yourproxyaddress:proxyport' to enable proxy variables HTTP_PROXY and http_proxy
* __HTTPS\_PROXY__
  * set this to a value like 'http://yourproxyaddress:proxyport' to enable proxy variables HTTPS_PROXY and https_proxy
* __FTP\_PROXY__
  * set this to a value like 'http://yourproxyaddress:proxyport' to enable proxy variables FTP_PROXY and ftp_proxy
* __NO\_PROXY__
  * set this to a value like 'http://yourproxyaddress:proxyport' to enable proxy variables NO_PROXY and no_proxy
* __APT\_PROXY__
  * set this to a value like 'http://yourproxyaddress:proxyport' to enable proxy inside apt configuration


# Usage

Run the container with this command:

  ```
  docker run -d --name rdesktop-nano -p 5901:5901 -p 80:80 ghcr.io/desktopcontainers/rdesktop
  ```
  
Connect to the container.  In the vnc connection string, type this:

"ipaddress:1"

The default password is "debian".


### Simple SSH X11 Forwarding

Since it is an X11 GUI software, usage is in two steps:
  1. Run a background container as server or start existing one.

  ```
  docker start rdesktop-nano || docker run -d --name rdesktop-nano -e 'RDESKTOP_OPTS=-k de -d MYDOMAIN -u johndoe' -e 'RDESKTOP_SERVER=172.10.1.1' ghcr.io/desktopcontainers/rdesktop
  ```

  2. Connect to the server using `ssh -X` (as many times you want).
     _Logging in with `ssh` automatically opens a rdesktop window_

  ```
  ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  -X app@$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' rdesktop-nano)
  ```