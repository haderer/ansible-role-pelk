#!/bin/bash

set -e

cat /etc/topbeat/topbeat.yml

topbeat -e -c /etc/topbeat/topbeat.yml
