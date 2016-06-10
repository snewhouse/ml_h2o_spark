#!/bin/bash

## move to HOME
cd ${INSTALL_DIR}

## get spark and stick it in  /usr/local/
cd /usr/local
curl -OL http://mirror.catn.com/pub/apache/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local/

cd /usr/local && \
ln -s spark-1.6.1-bin-hadoop2.6 spark

chmod -R 755 spark

export SPARK_HOME="/usr/local/spark"

echo 'export SPARK_HOME="/usr/local/spark"' >> ~/.zshrc ## specific to my local mac

source ~/.zshrc


## SET JAVA_HOME

## get h20

## get sparking water
wget http://h2o-release.s3.amazonaws.com/sparkling-water/rel-1.6/3/sparkling-water-1.6.3.zip
