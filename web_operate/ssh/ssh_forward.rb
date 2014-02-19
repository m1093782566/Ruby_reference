=begin
local (*args)
Starts listening for connections on the local host, and forwards them to the specified remote host/port via the SSH connection. This method accepts either three or four arguments. When four arguments are given, they are:

the local address to bind to
the local port to listen on
the remote host to forward connections to
the port on the remote host to connect to
If three arguments are given, it is as if the local bind address is "127.0.0.1", and the rest are applied as above.
=end

ssh.forward.local(1234, "www.capify.org", 80)
ssh.forward.local("0.0.0.0", 1234, "www.capify.org", 80)

=begin
remote (port, host, remote_port, remote_host="127.0.0.1")
Requests that all connections on the given remote-port be forwarded via the local host to the given port/host. The last argument describes the bind address on the remote host, and defaults to 127.0.0.1.

This method will return immediately, but the port will not actually be forwarded immediately. If the remote server is not able to begin the listener for this request, an exception will be raised asynchronously.

If you want to know when the connection is active, it will show up in the active_remotes list. If you want to block until the port is active, you could do something like this:
=end
ssh.forward.remote(80, "www.google.com", 1234, "0.0.0.0")
ssh.loop { !ssh.forward.active_remotes.include?([1234, "0.0.0.0"]) }
