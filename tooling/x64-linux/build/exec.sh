#!/usr/bin/env bash
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
ROOT=$SCRIPTPATH/../../..

mkdir -p $ROOT/build
mkdir -p $ROOT/install

docker run \
	--rm \
	-v $ROOT/:/src \
	-v $ROOT/build:/build \
	-v $ROOT/install:/install \
	-it build-linux-x64
