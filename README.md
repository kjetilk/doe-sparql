Using statistical Design of Experiments in SPARQL Endpoint Evaluations.
=======================================================================

All the code necessary to reproduce the study titled "Introducing
  Statistical Design of Experiments to SPARQL Endpoint Evaluation" by
  Kjernsmo & Tyssedal is published here.

Work to package the code in an R package is in progress, patches to
4store and scripts to run the experiments described are in this
directory.

Building patched 4store
-----------------------

This experiment has been run on Debian GNU/Linux and a Ubuntu
derivative. Detailed instructions may differ to other operating
systems, but the general idea should be possible to get from these. We
proceed with Debian-specific instructions:

First, get dependencies and tools to build, as root:
```
apt-get build-dep 4store
apt-get install automake git libtool uuid-dev
```

Then, as a normal user, check out this author's fork of 4store:

```
mkdir src
cd src
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
