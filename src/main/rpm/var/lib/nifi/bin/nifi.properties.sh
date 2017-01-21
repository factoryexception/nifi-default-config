#!/bin/bash

#
# Configuration
#
NIFI_USER=nifi
NIFI_HOME=/var/lib/nifi
NIFI_CONF=$NIFI_HOME/conf

#
# Configuration Files and Directories
#
BOOTSTRAP_CONF=$NIFI_CONF/bootstrap.conf
BOOTSTRAP_DIR=$NIFI_CONF/bootstrap
NIFI_PROPERTIES=$NIFI_CONF/nifi.properties
NIFI_PROPERTIES_DIR=$NIFI_CONF/properties

#
# Get Timestamp
#
NOW=`date -Is`

#
# Set Bootstrap Configuration
#
echo "#" > $BOOTSTRAP_CONF
echo "# Updated $NOW" >> $BOOTSTRAP_CONF
echo "#" >> $BOOTSTRAP_CONF

BOOTSTRAP_FILES=$BOOTSTRAP_DIR/*.conf
for BOOTSTRAP_FILE in $BOOTSTRAP_FILES; do
  echo "# Included $BOOTSTRAP_FILE" >> $BOOTSTRAP_CONF
  cat $BOOTSTRAP_FILE >> $BOOTSTRAP_CONF
done

#
# Set NiFi Properties
#
echo "#" > $NIFI_PROPERTIES
echo "# Updated $NOW" >> $NIFI_PROPERTIES
echo "#" >> $NIFI_PROPERTIES

NIFI_PROPERTIES_FILES=$NIFI_PROPERTIES_DIR/*.properties
for NIFI_PROPERTIES_FILE in $NIFI_PROPERTIES_FILES; do
  echo "# Included $NIFI_PROPERTIES_FILE" >> $NIFI_PROPERTIES
  cat $NIFI_PROPERTIES_FILE >> $NIFI_PROPERTIES
done

#
# Set permissions
#
chown $NIFI_USER.$NIFI_USER $BOOTSTRAP_CONF
chmod 640 $BOOTSTRAP_CONF

chown $NIFI_USER.$NIFI_USER $NIFI_PROPERTIES
chmod 640 $NIFI_PROPERTIES
