pipe = IO.popen("local/util/pig", "w+") #/local/util/pig is a util that translates English to latin
pipe.puts "ice cream after they go to bed" #main process take "pipe"
pipe.close_write #tell pig that input is closed and you need to write flush to pipe
puts pipe.gets
