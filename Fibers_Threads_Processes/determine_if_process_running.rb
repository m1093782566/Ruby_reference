pid = ARGV[0].to_i

begin
  Process.kill(0, pid)
  puts "#{pid} is running"
rescue Errno::EPERM                     # changed uid
  puts "No permission to query #{pid}!";
rescue Errno::ESRCH
  puts "#{pid} is NOT running.";      # or zombied
rescue
  puts "Unable to determine status for #{pid} : #{$!}" #$! exception information
end

#usage: ruby xxx.rb pid
#reference: http://pleac.sourceforge.net/pleac_ruby/processmanagementetc.html
