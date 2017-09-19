#!/bin/sh

# Move to project root
ROOT_DIR=`dirname $0`/..
cd $ROOT_DIR

docker run -it chronium_builder bash
