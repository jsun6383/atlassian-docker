#!/bin/bash

shut_down() {
    echo "stopping bitbucket..."
    /opt/bitbucket/software/bin/stop-bitbucket.sh
}

trap "shut_down" SIGTERM SIGHUP SIGINT EXIT

/opt/bitbucket/software/bin/start-bitbucket.sh -fg &

wait
