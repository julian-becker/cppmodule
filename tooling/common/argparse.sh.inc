#!/usr/bin/env bash

function arg {
        local ARGNAME=$1; shift
        for i in "$@"; do
                case $i in
                --${ARGNAME}=*)
                        echo "local ${ARGNAME//-/_}=${i#*=}"
                        return 0
                        ;;
                esac
        done
        return -1
}

function optarg {
        local ARGNAME=$1; shift
        local DEFAULT=$1; shift
        for i in "$@"; do
                case $i in
                --${ARGNAME}=*)
                        echo "local ${ARGNAME//-/_}=${i#*=}"
                        return 0
                        ;;
                esac
        done
        echo "local ${ARGNAME//-/_}=${DEFAULT}"
}

function realpath {
	cd $1 ; pwd -P
}
