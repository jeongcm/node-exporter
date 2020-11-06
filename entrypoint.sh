#!/bin/sh

if [ "${NODE_ID}" == "" ]; then
    echo "ERROR: NODE_ID ENV is required for this container to run"
    exit 1
fi

if [ "${NODE_NAME}" == "" ]; then
    echo "ERROR: NODE_NAME ENV is required for this container to run"
    exit 1
fi

NODE_IP=$(nslookup -type=any $NODE_NAME | sed -n '5p'| awk '{print $2}')

echo "node_meta{node_id=\"$NODE_ID\", container_label_com_docker_swarm_node_id=\"$NODE_ID\", \
node_name=\"$NODE_NAME\", node_ip=\"$NODE_IP\"} 1" > /node-meta.prom

/bin/node_exporter --collector.textfile.directory=/