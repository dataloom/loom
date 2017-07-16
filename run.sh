#!/bin/bash
# Total available RAM: 62g

# Conductor JVM settings
CONDUCTOR_XMS="40g"
CONDUCTOR_XMX="40g"
CONDUCTOR_ARGS="cassandra spark aws"

# Datastore JVM settings
DATASTORE_XMS="12g"
DATASTORE_XMX="12g"
DATASTORE_ARGS="cassandra aws"

#Neuron JVM settings
NEURON_XMS="4g"
NEURON_XMX="4g"
NEURON_ARGS="cassandra aws"

#Total in use = 40 + 12 + 4 = 56g out of 62g

nohup ./gradlew :conductor:run > /opt/conductor.log 2>&1& echo $! >conductor.pid
sleep 20
nohup ./gradlew :datastore:run > /opt/datastore.log 2>&1& echo $! >datastore.pid
sleep 20
nohup ./gradlew :datastore:neuron > /opt/neuron.log 2>&1& echo $! >datastore.pid
sleep 10

tail -f /opt/conductor.log /opt/datastore.log /opt/neuron.log