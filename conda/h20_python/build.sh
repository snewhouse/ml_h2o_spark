#!/bin/bash

cd $PREFIX/bin
## python
pip install -U requests
pip install -U tabulate
pip install -U future
pip install -U six
pip install scikit-learn
pip uninstall h2o
pip install http://h2o-release.s3.amazonaws.com/h2o/rel-turchin/8/Python/h2o-3.8.2.8-py2.py3-none-any.whl
