# auto_restart_listner

Yes, you can create a simple bash script to automatically restart your listener (`nc` command) after it is killed, while incrementing the port number each time. Below is an example script that will achieve this behavior:

```bash
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
```

### How this works:
1. **Initial Port Setup**: The script starts with a port number `4444` and stores it in the `PORT` variable.
2. **While Loop**: The script enters an infinite `while` loop. The `nc` (Netcat) command runs with the current value of `$PORT`.
3. **Listener Restart**: After `nc` exits (i.e., when you kill it or the connection is closed), the script increments the `PORT` variable by 1 (`PORT=$((PORT + 1))`).
4. **Restart the Listener**: It then restarts the listener on the new port, and the process repeats indefinitely.

### How to run:
1. Save the script to a file, for example, `start_listener.sh`.
2. Make it executable:
   ```bash
   chmod +x start_listener.sh
   ```
3. Run the script:
   ```bash
   ./start_listener.sh
   ```

This script will keep incrementing the port number and restarting the listener each time it is stopped.

### Notes:
- The script will keep running indefinitely, so you may need to stop it manually with `Ctrl+C`.
- Ensure that the ports you plan to use are open and not blocked by a firewall or other restrictions.
