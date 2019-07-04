#!/bin/bash

docker build . -t zeitio/ruby-node-stack:ruby2.6.3_node10

docker push zeitio/ruby-node-stack:ruby2.6.3_node10

