#!/bin/sh

# Move to project root
ROOT_DIR=`dirname $0`/..
cd $ROOT_DIR

docker build -t chronium_builder .
