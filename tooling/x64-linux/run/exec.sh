#!/usr/bin/env bash
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
ROOT=$SCRIPTPATH/../../..

set -e

source $ROOT/tooling/common/argparse.sh.inc

function run {
	$(arg from $@)
	docker run \
		--rm \
		-v $(realpath $from):/install \
		-it run-linux-x64
}

run --from=$ROOT/install
