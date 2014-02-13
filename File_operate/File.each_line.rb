File.open("testfile") do |file|
  file.each_line("e") {|line| puts "Got #{ line.dump }" } #separate by "e", default is "/n"
end

#produces:
#Got "this is line"
#Got "one"
#Got "\nThis is line"

IO.foreach("testfile") {|line| puts line } #In this case, same as File.foreach

