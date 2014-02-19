def socket_readable?(ip, port)
  socket = TCPSocket.new(ip, port)
  if IO.select([socket], nil, nil, 5)
    logger.debug("tcp socket #{ip}:#{port} is readable")
    yield
    true
  else
    false
  end
rescue SocketError => e
  logger.debug("tcp socket #{ip}:#{port} SocketError: #{e.inspect}")
  sleep 1
  false
rescue SystemCallError => e
  logger.debug("tcp socket #{ip}:#{port} SystemCallError: #{e.inspect}")
  sleep 1
  false
ensure
  socket.close if socket
end
#usage:
#loop until socket_readable?(ip, @ssh_port) { sleep(@ssh_wait) }
