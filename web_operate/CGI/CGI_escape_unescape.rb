require 'cgi'
puts CGI.escape("Nicholas Payton/Trumpet & Flugel Horn")
#produces:
#Nicholas+Payton%2FTrumpet+%26+Flugel+Horn

#More frequently, you may want to escape HTML special characters:
require 'cgi'
puts CGI.escapeHTML("a < 100 && b > 200")
#produces:
#a &lt; 100 &amp;&amp; b &gt; 200

#To get really fancy, you can decide to escape only certain HTML elements within a string:
require 'cgi'
puts CGI.escapeElement('<hr><a href="/mp3">Click Here</a><br>','A')
#produces:
#<hr>&lt;a href=&quot;/mp3&quot;&gt;Click Here&lt;/a&gt;<br>

#Here only the <a...> element is escaped; other elements are left alone. Each of these methods
#has an un- version to restore the original string:
require 'cgi'
puts CGI.unescapeHTML("a &lt; 100 &amp;&amp; b &gt; 200")
#produces:
#a < 100 && b > 200
