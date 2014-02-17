#CGI run on server side
require 'cgi'
cgi = CGI.new
cgi['name']
# => "Dave Thomas"
# cgi['reason'] # => "flexible"

cgi = CGI.new
cgi.params
cgi.params['name']
cgi.params['reason']

require 'cgi'
cgi = CGI.new
cgi.has_key?('name') # => true
cgi.has_key?('age') # => false
