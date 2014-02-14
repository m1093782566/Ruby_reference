exec("sort testfile > output.txt") if fork.nil?
# The sort is now running in a child process
# carry on processing in the main program
# ... dum di dum ...
# then wait for the sort to finish, mainprocess do nothing but wait!
Process.wait

#If you'd rather be notified when a child exits (instead of just waiting around),
#you can set up a signal handler using Object#trap
trap("CLD") do #register the process block for signal CLD, CLD/CHLD--CHILD
  pid = Process.wait
  puts "Child pid #{pid}: terminated"
end

fork { exec("sort testfile > output.txt") } #subprocess execute it firstly, when finished, it will call registered block
# Do other stuff...
# produces:
# Child pid 22026: terminated
