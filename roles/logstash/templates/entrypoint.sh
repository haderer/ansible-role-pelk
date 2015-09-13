#!/bin/bash

set -e


logstash --config /etc/logstash/conf.d -w 1

#-l log

exit 0