#!/bin/bash
# Total available RAM: 62g

# Conductor JVM settings
export CONDUCTOR_XMS="-Xms40g"
export CONDUCTOR_XMX="-Xms40g"
export CONDUCTOR_ARGS="cassandra spark aws"

# Datastore JVM settings
export DATASTORE_XMS="-Xms12g"
export DATASTORE_XMX="-Xms12g"
export DATASTORE_ARGS="cassandra aws"

#Neuron JVM settings
export NEURON_XMS="-Xms4g"
export NEURON_XMX="-Xms4g"
export NEURON_ARGS="cassandra aws"

#Total in use = 40 + 12 + 4 = 56g out of 62g

nohup ./gradlew :conductor:run > /dev/null 2>&1& echo $! >conductor.pid
sleep 20
nohup ./gradlew :datastore:run > /dev/null 2>&1& echo $! >datastore.pid
sleep 20
nohup ./gradlew :neuron:run > /dev/null 2>&1& echo $! >neuron.pid
sleep 10

tail -f ./logging/conductor.log ./logging/datastore.log ./logging/neuron.log