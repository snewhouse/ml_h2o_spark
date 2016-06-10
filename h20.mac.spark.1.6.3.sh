#!/bin/bash

## move to HOME
cd ${INSTALL_DIR}

## get spark and stick it in  /usr/local/
curl -OL http://www.apache.org/dyn/closer.lua/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz
cd /usr/local && ln -s spark-1.6.1-bin-hadoop2.6 spark
chmod -R 755 spark
export SPARK_HOME="/usr/local/spark"

echo "export SPARK_HOME /usr/local/spark" >> .zrsh ## specific to my local mac
source .zrsh


## STE JAVA_HOME

export SPARK_HOME="/path/to/spark/installation"

## get h20

## get sparking water
wget http://h2o-release.s3.amazonaws.com/sparkling-water/rel-1.6/3/sparkling-water-1.6.3.zip
