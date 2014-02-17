# ruby -r profile xxx.rb, showing the most time-consuming method
# reference programming ruby p202
count = 0
words = File.open("/usr/share/dict/words")

while word = words.gets
  word = word.chomp!
  if word.length == 12
    count += 1
  end
end

words.close
puts "#{count} twelve-character words"

#-->, optimized
words2 = File.read("/usr/share/dict/words") #File.read returns String(words2) with content of the file, not the File object
count = words2.scan(/^............\n/).size

puts "#{count} twelve-character words"
