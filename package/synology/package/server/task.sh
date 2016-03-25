#!/bin/sh

export DATA="`dirname $0`/data"
export TASK="$1"

export JAVA_OPTS=`free | awk -vm=1024 -vp=0.7 '/Mem:/ {printf "-Xmx%dm", ($2*p)/m; exit}'`    # set -Xmx to 0.7 of physical memory

filebot "@$DATA/task/$TASK.args" 2>&1 | tee -a "$DATA/log/$TASK.log"