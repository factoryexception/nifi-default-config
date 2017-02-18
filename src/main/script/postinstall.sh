NIFI_HOME=/var/lib/nifi
NIFI_HOME_BIN=$NIFI_HOME/bin
NIFI_DIST=/usr/share/nifi-distribution
NIFI_DIST_BIN=$NIFI_DIST/bin
NIFI_SH=nifi.sh
NIFI_ENV_SH=nifi-env.sh

NIFI_USER=nifi
NIFI_GROUP=nifi

cp $NIFI_DIST_BIN/$NIFI_SH $NIFI_HOME_BIN/$NIFI_SH
cp $NIFI_DIST_BIN/$NIFI_ENV_SH $NIFI_HOME_BIN/$NIFI_ENV_SH

chown $NIFI_USER:$NIFI_GROUP $NIFI_HOME_BIN/$NIFI_SH
chown $NIFI_USER:$NIFI_GROUP $NIFI_HOME_BIN/$NIFI_ENV_SH

systemctl daemon-reload
systemctl enable nifi.service
