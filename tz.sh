#!/usr/bin/env bash

set -e

if [[  ${TZ} != "" ]];then
   timedatectl set-timezone ${TZ}
fi

