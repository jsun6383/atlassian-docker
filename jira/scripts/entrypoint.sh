#!/bin/bash

shut_down() {
    echo "stopping jira..."
    /opt/jirasoftware/bin/stop-jira.sh
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

/opt/jirasoftware/bin/start-jira.sh -fg
