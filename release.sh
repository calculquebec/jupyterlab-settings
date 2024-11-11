#!/bin/bash

set -e
VERSION=${1:?Missing release version number}

TMPDIR=$(mktemp -d)
FOLDER=$TMPDIR/jupyter-$VERSION

mkdir -p $FOLDER releases/

cp -v -r .jupyter $FOLDER

cd $FOLDER
zip -v jupyter-$VERSION.zip -r .

cd -
cp $FOLDER/jupyter-$VERSION.zip releases/

rm -r $TMPDIR
