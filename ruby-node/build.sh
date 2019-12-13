#!/bin/bash

export RUBY_VERSION=$1
export NODE_VERSION=$2

docker build . -t zeitio/ruby-node-stack:ruby${RUBY_VERSION}_node${NODE_VERSION} --build-arg RUBY_VERSION=${RUBY_VERSION} --build-arg NODE_VERSION=${NODE_VERSION}

docker push zeitio/ruby-node-stack:ruby${RUBY_VERSION}_node${NODE_VERSION}

