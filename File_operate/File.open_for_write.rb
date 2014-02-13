# Note the "w", which opens the file for writing, r read, r+ read&write
File.open("output.txt", "w") do |file|
 file.puts "Hello"
 file.puts "1 + 2 = #{1+2}"
end
# Now read the file in and print its contents to STDOUT
puts File.read("output.txt")
# produces:
# Hello
# 1 + 2 = 3
