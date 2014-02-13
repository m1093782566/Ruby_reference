file = File.new("testfile", "r")
# ... process the file
file.close

File.open("testfile", "r") do |file|
  # ... process the file
  while line = file.gets
    puts line
  end
end # <-file automatically closed here

#It's as if the open method looks like the following:
class File
  def File.open(*args)
    result = f = File.new(*args)
    if block_given?
      begin
        result = yield f
      ensure
        f.close
      end
    end
    result
  end
end
