#!/bin/sh
CONDA_DIR=~/miniconda3
PACKAGE=$1
VERSION=$2

conda skeleton pypi $PACKAGE
conda build $PACKAGE --no-anaconda-upload
conda convert $CONDA_DIR/conda-bld/osx-64/$PACKAGE-$VERSION*.tar.bz2 -o $CONDA_DIR/conda-bld/ --platform all
anaconda upload $CONDA_DIR/conda-bld/win-32/$PACKAGE-$VERSION*.tar.bz2
anaconda upload $CONDA_DIR/conda-bld/win-64/$PACKAGE-$VERSION*.tar.bz2
anaconda upload $CONDA_DIR/conda-bld/linux-32/$PACKAGE-$VERSION*.tar.bz2
anaconda upload $CONDA_DIR/conda-bld/linux-64/$PACKAGE-$VERSION*.tar.bz2

rm -r $PACKAGE
conda build purge
