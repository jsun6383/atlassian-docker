#!/bin/bash

shut_down() {
    echo "stopping bamboo..."
    /opt/bamboo/atlassian-bamboo-6.3.2/bin/stop-bamboo.sh
}

trap 'shut_down' SIGTERM SIGINT

/bin/bash /opt/bamboo/atlassian-bamboo-6.3.2/bin/start-bamboo.sh -fg & 

wait