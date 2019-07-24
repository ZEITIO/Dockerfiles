#!/bin/bash

docker build . -t zeitio/php-node-stack:php7.2_node10

docker push zeitio/php-node-stack:php7.2_node10
