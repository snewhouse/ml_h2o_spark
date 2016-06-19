
# To Do

need to move back to linux soon...all currently on ox-x-64 el cap.

## R & Jupytper

all a bit shite for now even after fresh install.

```
sjnewhouse@MacBook-Pro-6:~|⇒  jupyter notebook
[I 10:55:48.688 NotebookApp] The port 8888 is already in use, trying another port.
[I 10:55:48.689 NotebookApp] The port 8889 is already in use, trying another port.
[I 10:55:48.690 NotebookApp] The port 8890 is already in use, trying another port.
[I 10:55:48.690 NotebookApp] The port 8891 is already in use, trying another port.
[I 10:55:48.707 NotebookApp] Serving notebooks from local directory: /Users/sjnewhouse
[I 10:55:48.707 NotebookApp] 0 active kernels
[I 10:55:48.708 NotebookApp] The Jupyter Notebook is running at: http://localhost:8892/
[I 10:55:48.708 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[I 10:55:54.065 NotebookApp] Creating new notebook in
[I 10:55:55.095 NotebookApp] Kernel started: 85e17cb2-608d-442c-8e89-1cd8731c1e33
Error in dyn.load(file, DLLpath = DLLpath, ...) :
  unable to load shared object '/Users/sjnewhouse/anaconda3/lib/R/library/rzmq/libs/rzmq.so':
  dlopen(/Users/sjnewhouse/anaconda3/lib/R/library/rzmq/libs/rzmq.so, 6): Library not loaded: @rpath/libzmq.5.dylib
  Referenced from: /Users/sjnewhouse/anaconda3/lib/R/library/rzmq/libs/rzmq.so
  Reason: image not found
Calls: :: ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
```

conda R 3.2.2!! needs a kick up the butt! see issues

#### Fix
- fresh install  anaconda and rm `~/.anaconda`  
- https://github.com/conda/conda/issues/1722  see tips here! dont update!  
- dont use conda r or r-essentials  
- use system R and install https://irkernel.github.io/   
- conflict coming when needing to use conda r-packages   

## Docker Stacks
Opinionated stacks of ready-to-run Jupyter applications in Docker.  
- https://github.com/jupyter/docker-stacks


## anaconda cluster
- https://anaconda.org/anaconda-cluster  
- https://docs.continuum.io/anaconda-cluster/quickstart  
- https://docs.continuum.io/anaconda-cluster/index  


```
conda install -c anaconda-cluster scala=2.11.1  
conda install -c anaconda-cluster spark=1.6.0  
```

## Using Anaconda with Hadoop: Distributed language processing with PySpark

- https://anaconda.org/anaconda-cluster/notebook-pyspark-language/notebook

## R: Caret
- caret still has rich set of ML methods and wrapper functions.  
- http://topepo.github.io/caret/  

## spark.ml
- http://spark.apache.org/docs/latest/ml-guide.html

## Python ml
- https://github.com/rasbt/python-machine-learning-book  
- https://github.com/rasbt/mlxtend  
- `conda install -c rasbt mlxtend`  
- http://www.kdnuggets.com/2015/11/seven-steps-machine-learning-python.html  
- http://learnpythonthehardway.org/book/  

## Sparkling Water
playing with Sparkling Water

- http://www.h2o.ai/product/sparkling-water/  
- http://www.h2o.ai/  
- https://github.com/h2oai/h2o-3  
- http://www.h2o.ai/download/sparkling-water/spark16

Docker : https://github.com/sequenceiq/docker-spark  

get docker hadoop and spark images 

```bash
docker pull sequenceiq/hadoop-docker:2.7.0

docker pull sequenceiq/spark:1.6.0
```

get H20

```bash
git clone https://github.com/h2oai/h2o-3.git
```
