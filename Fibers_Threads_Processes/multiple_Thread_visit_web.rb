require 'net/http'

pages = %w( www.rubycentral.org slashdot.org  www.google.com )

threads = pages.map do |page_to_fetch|
  Thread.new(page_to_fetch) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    resp = http.get('/')
    print "Got #{url}: #{resp.message}\n"
  end
end
threads.each { |thr| thr.join } #join means parent thread wait until all child threads finish

#produces:
#Fetching: www.rubycentral.org
#Fetching: slashdot.org
#Fetching: www.google.com
#Got www.google.com: OK
#Got slashdot.org: OK
#Got www.rubycentral.org: OK
