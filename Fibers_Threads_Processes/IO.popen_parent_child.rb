pipe = IO.popen("-","w+") #"-" means ruby interpreter, "w+" means r+w
if pipe
  pipe.puts "Get a job!"
  STDERR.puts "Child says '#{pipe.gets.chomp}'"
else
  STDERR.puts "Dad says '#{gets.chomp}'"
  puts "OK"
end
#produces:
#Dad says 'Get a job!'
#Child says 'OK'

#Without STDERR., puts write the output to the stdout.
#stdout in the child process is pipe. Anything written to the stdout is not printed, but sent to the pipe.
