#!/bin/bash

cd $PREFIX/bin
## python
pip install -U requests
pip install -U tabulate
pip install -U future
pip install -U six
pip install scikit-learn
##pip uninstall h2o
pip install h2o
