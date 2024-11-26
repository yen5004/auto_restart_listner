#!/bin/bash

# Starting port
PORT=4444

# Loop to keep the listener running
while true; do
    echo "Starting listener on port $PORT..."
    
    # Start the listener on the specified port
    nc -lvnp $PORT
    
    # If nc exits (i.e., the connection is closed), increment the port and restart
    PORT=$((PORT + 1))
    echo "Listener on port $((PORT - 1)) stopped. Starting listener on port $PORT..."
done
