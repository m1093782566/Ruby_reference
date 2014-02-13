require 'net/http'
http = Net::HTTP.new('pragprog.com', 80)
response = http.get('/book/ruby3/programming-ruby-1-9')
if response.message == "OK"
  puts response.body.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end

#produces:
#http://pragprog.com/assets/logo-c5c7f9c2f950df63a71871ba2f6bb115.gif
#http://pragprog.com/assets/drm-free80-9120ffac998173dc0ba7e5875d082f18.png
#http://imagery.pragprog.com/products/99/ruby3_xlargecover.jpg?1349967653
#
#this example could be improved significantly. In particular,
#it doesn't do much in the way of error handling. It should really report "Not Found" errors
#(the infamous 404) and should handle redirects (which happen when a web server gives the
#client an alternative address for the requested page).
