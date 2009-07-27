#!/bin/bash
set -e
./deploy_gpxe.sh
./configure_BKO.sh
./deploy_BKO.sh

