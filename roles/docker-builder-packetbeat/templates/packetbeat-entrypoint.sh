#!/bin/bash

set -e

cat /etc/packetbeat/packetbeat.yml

packetbeat -e -c  /etc/packetbeat/packetbeat.yml
