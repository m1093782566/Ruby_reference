require 'socket'
client = TCPSocket.open('127.0.0.1', 'www')
client.send("OPTIONS /~dave/ HTTP/1.0\n\n", 0)
puts client.readlines
client.close

#produces:
#HTTP/1.1 200 OK
#Date: Mon, 27 May 2013 17:31:00 GMT
#Server: Apache/2.2.22 (Unix) DAV/2 PHP/5.3.15 with Suhosin-Patch mod_ssl/2.2.22
#OpenSSL/0.9.8r
#Allow: GET,HEAD,POST,OPTIONS
#Content-Length: 0
#Connection: close
#Content-Type: text/html
