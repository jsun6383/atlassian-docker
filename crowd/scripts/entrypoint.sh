#!/bin/bash

shut_down() {
    echo "stopping jira..."
    /opt/crowdsoftware/stop_crowd.sh
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

/opt/crowdsoftware/start_crowd.sh -fg

