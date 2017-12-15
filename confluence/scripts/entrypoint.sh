#!/bin/bash

shut_down() {
    echo "stopping confluence..."
    /opt/confluencesoftware/bin/stop-confluence.sh
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

/opt/confluencesoftware/bin/start-confluence.sh -fg
