#!/bin/bash

## JAVA ------------------------------------------##

# SET JAVA_HOME
#  /usr/libexec/java_home  -V
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home"
echo 'export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home"' >> ~/.zshrc ## specific to my local mac
source ~/.zshrc

# echo 'export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home"' >> ~/.bashrc ## specific to my local mac
# source ~/.bashrc


## SPARK ------------------------------------------##

# get spark and stick it in /usr/local/
curl -OL http://mirror.catn.com/pub/apache/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local/

# add symbolic link
cd /usr/local && \
ln -s spark-1.6.1-bin-hadoop2.6 spark

# sort permissions
chmod -R 755 spark

# export spark path
export SPARK_HOME="/usr/local/spark"

# add to my
echo 'export SPARK_HOME="/usr/local/spark"' >> ~/.zshrc ## specific to my local mac
source ~/.zshrc

# echo 'export SPARK_HOME="/usr/local/spark"' >> ~/.bashrc ## specific to my local mac
# source ~/.bashrc


## H20 ------------------------------------------#

# desktop
cd /usr/local
curl -o h2o.zip http://download.h2o.ai/versions/h2o-3.8.2.8.zip
unzip h2o-3.8.2.8.zip

## python
sudo pip install -U requests
sudo pip install -U tabulate
sudo pip install -U future
sudo pip install -U six
sudo pip uninstall h2o
sudo pip install http://h2o-release.s3.amazonaws.com/h2o/rel-turchin/8/Python/h2o-3.8.2.8-py2.py3-none-any.whl

## sparking water -------------------------------#
# get sparking water
wget http://h2o-release.s3.amazonaws.com/sparkling-water/rel-1.6/3/sparkling-water-1.6.3.zip
