#!/bin/bash

/bin/bash /var/lib/kafka/bin/zookeeper-server-start.sh -daemon ${KAFKA_HOME}/config/zookeeper.properties
/bin/bash /var/lib/kafka/bin/kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties

tail -f /dev/null