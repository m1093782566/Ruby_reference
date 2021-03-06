#Sessions are handled by class CGI::Session, which uses cookies but provides a higher-level abstraction.
require 'cgi'
require 'cgi/session'

cgi = CGI.new("html4")
sess = CGI::Session.new(cgi, "session_key" => "rubyweb",
                             "prefix"      => "web-session.")

if sess['lastaccess']
  msg = "<p>You were last here #{sess['lastaccess']}.</p>"
else
  msg = "<p>Looks like you haven't been here for a while</p>"
end

count = (sess["accesscount"] || 0).to_i
count += 1

msg << "<p>Number of visits: #{count}</p>"

sess["accesscount"] = count
sess["lastaccess"]  = Time.now.to_s
sess.close

cgi.out {
  cgi.html {
    cgi.body {
      msg
    }
  }
}
#The code in the previous example used the default storage mechanism for sessions: persistent
#data was stored in files in your default temporary directory (see Dir.tmpdir). The filenames
#will all start with web-session. and will end with a hashed version of the session number. See
#the documentation for CGI::Session for more information.
