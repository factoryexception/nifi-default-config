USERNAME=nifi
DAEMON_GROUP=daemon
HOME_DIR=/var/lib/nifi
DEFAULT_SHELL=/sbin/nologin

USERNAME_FOUND=$(getent passwd $USERNAME)
if [ -z $USERNAME_FOUND ]; then
  useradd -d $HOME_DIR -G $DAEMON_GROUP --system --shell $DEFAULT_SHELL $USERNAME
fi
