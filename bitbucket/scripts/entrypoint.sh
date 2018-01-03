#!/bin/bash

shut_down() {
    echo "stopping bitbucket..."
    /opt/bitbucketsoftware/bin/stop-bitbucket.sh
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

/opt/bitbucketsoftware/bin/start-bitbucket.sh -fg
