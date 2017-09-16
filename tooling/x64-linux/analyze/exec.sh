#!/usr/bin/env bash
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
ROOT=$SCRIPTPATH/../../..

mkdir -p $ROOT/build

docker run \
	--rm \
	-v $ROOT/:/work \
	-v $ROOT/build:/build \
	-it analyze-linux-x64
