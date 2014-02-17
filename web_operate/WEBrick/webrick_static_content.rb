require 'webrick'
include WEBrick
s = HTTPServer.new(Port: 2000,DocumentRoot: File.join(Dir.pwd, "/html"))
trap("INT") { s.shutdown }
s.start
#If you point your browser at http://localhost:2000, you should see a listing of your html subdirectory.

