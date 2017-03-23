!#/bin/bash

echo "Flume home: " $FLUME_HOME
echo "Flume root log: " $FLUME_ROOT_LOG
echo "Flume configuration file: " $FLUME_CONF_FILE
echo "Flume configuration directory: " $FLUME_CONF_DIR
echo "Agent name: " $AGENT_NAME

#/opt/apache-flume/bin/flume-ng agent -n agent -c /opt/apache-flume/conf -f /opt/apache-flume/conf/generic.conf -Dflume.root.logger=INFO,console 
$FLUME_HOME/bin/flume-ng agent -n $AGENT_NAME -c $FLUME_CONF_DIR -f $FLUME_CONF_FILE -Dflume.root.logger=$FLUME_ROOT_LOG 