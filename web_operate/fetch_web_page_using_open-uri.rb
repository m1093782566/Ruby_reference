require 'open-uri'
page = "podcasts"
file_name = "#{page}.html"
web_page = open("http://pragprog.com/#{page}")
output = File.open(file_name, "w")
begin
  while line = web_page.gets
    output.puts line
  end
  output.close
rescue Exception
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise
end

#briefly
require 'open-uri'
open('http://pragprog.com') do |f|
  puts f.read.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end

#produces:
#http://pragprog.com/assets/logo-c5c7f9c2f950df63a71871ba2f6bb115.gif
#http://pragprog.com/assets/drm-free80-9120ffac998173dc0ba7e5875d082f18.png
#http://imagery.pragprog.com/products/353/jvrails2_xlargebeta.jpg?1368826914

#By bringing the open-uri library into a program, the
#Object#open method suddenly recognizes http:// and ftp:// URLs in the filename.
#Not just that--it also handles redirects automatically.
