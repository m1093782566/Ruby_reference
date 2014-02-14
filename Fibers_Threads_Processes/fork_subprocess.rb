fork do
  puts "In child, pid = #$$" #equal to #{$$}
  exit 99
end
pid = Process.wait
puts "Child terminated, pid = #{pid}, status = #{$?.exitstatus}"
#produces:
#In child, pid = 24160
#Child terminated, pid = 24160, status = 99
