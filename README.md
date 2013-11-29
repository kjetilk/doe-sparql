Using statistical Design of Experiments in SPARQL Endpoint Evaluations.
=======================================================================

All the code necessary to reproduce the study titled ["Introducing
  Statistical Design of Experiments to SPARQL Endpoint Evaluation"](http://folk.uio.no/kjekje/2013/iswc.pdf) by
  Kjernsmo & Tyssedal is published here.

Here, you will learn how to download and install the R code developed
for the study. You will then learn to build, install and run several
4store instances with different degradation. You will finally be
pointed to other documentation to actually run the study.

This experiment has been run on Debian GNU/Linux and a Ubuntu
derivative. Detailed instructions may differ to other operating
systems, but the general idea should be possible to get from these. We
proceed with Debian-specific instructions:


Download and installing this code
---------------------------------

First, as root, install all dependencies:
```
apt-get install curl libcurl4-gnutls-dev r-recommended r-cran-bitops r-cran-gtools r-cran-plyr r-cran-relimp r-cran-vcd libigraph0-dev r-cran-scatterplot3d r-cran-colorspace
```
If you have a different operating system, all these dependencies must
be installed from other sources.

Then, as your usual user, get the code, e.g.:
```
mkdir src
cd src
git clone https://github.com/kjetilk/doe-sparql.git
```


Then start R, simply by the letter R on the command line. Then, in the
R shell:
```{r}
install.packages(c("DoE.base", "FrF2"))
install.packages("doe-sparql/doesparql_1.01.tar.gz", repos=NULL, type="source")
```

You may now load the experimentation code and test that the install
was successful by timing an example query against DBPedia:

```{r}
library(doesparql)
example(timeQuery)
```


Building patched 4store
-----------------------

First, get dependencies and tools to build, as root:
```
apt-get build-dep 4store
apt-get install automake git libtool uuid-dev
```

Then, as a normal user, check out this author's fork of 4store:

```
git clone https://github.com/kjetilk/4store.git
```

Then, checkout the branch that will make 4store sleep while doing
JOINs:

```
cd 4store/
git checkout bgp-slow
```

Now, configure and build one server (modify paths as desired):
```
sh autogen.sh
mkdir -p $HOME/4store-bgp-slow/data
./configure --with-storage-path=$HOME/4store-bgp-slow/data --prefix=$HOME/4store-bgp-slow/
make install
```

Then, check out the other branch and repeat the procedure:

```
git checkout filter-slow
mkdir -p $HOME/4store-filter-slow/data
./configure --with-storage-path=$HOME/4store-filter-slow/data --prefix=$HOME/4store-filter-slow/
make install
```

You should now have two independent installations of 4store, each with
different artificial drawbacks.

Then, the same proceedure should be repeated on a different machine to
allow for testing different hardware.

Starting 4store instances
-------------------------

First, the a dataset is needed. We used the dataset of the [DBPedia
SPARQL Benchmark](http://aksw.org/Projects/DBPSB.html). We used a
subset of the last 1 or 2 million triples in most runs (see the paper
for details), they can be obtained using the tail command.

You will now set up and import those data, possibly modifying the path
to the data files:

```
cd $HOME/4store-filter-slow
bin/4s-backend-setup largefilter
bin/4s-backend-setup smallfilter
bin/4s-backend largefilter
bin/4s-backend smallfilter
bin/4s-import -v largefilter benchmark_2.nt
bin/4s-import -v smallfilter benchmark_1.nt
```

The procedure is then repeated for the JOIN operation factor:

```
cd $HOME/4store-bgp-slow
bin/4s-backend-setup largebgp
bin/4s-backend-setup smallbgp
bin/4s-backend largebgp
bin/4s-backend smallbgp
bin/4s-import -v largebgp benchmark_2.nt
bin/4s-import -v smallbgp benchmark_1.nt
```

Now, to be able to run several servers at the same time, we bind the
different instances of 4store to different ports, with port numbers
that match the levels of the relevant factors. E.g. port 8012 will
host a server with the smaller number of triples and the delay in
JOIN, where the last two digits correspond to the levels.

To simplify starting the servers as well as test them to ensure they
are up, we include a script by the name run.sh in this directory. This
can be run as

```
cd ../
src/doe-sparql/run.sh
```

If no endpoints was running before the script was executed, it will
first report an error that can be disregarded, and then a list of all
4store processes. When the script returns

```
http://localhost:8011/status/ 200
http://localhost:8012/status/ 200
http://localhost:8021/status/ 200
http://localhost:8022/status/ 200
```
i.e. returns that all endpoints are running by reporting their HTTP
code 200, this procedure should also be repeated on a different machine.

When both machines are running 4 endpoints, the experimenter may
proceed to run the experiment using the above R module. To launch
that, go to the directory containing the experimental setup directory,
which should be R's working directory for the experiment,
and launch e.g.

```
cd src/doe-sparql/
R
```
and then load the library and visit its package help file:
```{r}
library(doesparql)
help(doesparql)
```

The package help file contains further instructions with examples for
the analysis of the experiment.

Licence
-------

The R package carries the MIT License, the rest in this repository is
released under CC0. These are very permissive terms.