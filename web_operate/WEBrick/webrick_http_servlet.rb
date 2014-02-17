#WEBrick can do far more than serve static content. You can use it just like a Java servlet
#container. The following code mounts a simple servlet at the location /hello. As requests
#arrive, the do_GET method is invoked. It uses the response object to display the user agent
#information and parameters from the request.
require 'webrick'
include WEBrick
s = HTTPServer.new(Port: 2000)
class HelloServlet < HTTPServlet::AbstractServlet
def do_GET(req, res)
res['Content-Type'] = "text/html"
res.body = %{
<html><body>
<p>Hello. You're calling from a #{req['User-Agent']}</p>
<p>I see parameters: #{req.query.keys.join(', ')}</p>
</body></html>}
end
end
s.mount("/hello", HelloServlet)
trap("INT"){ s.shutdown }
s.start
