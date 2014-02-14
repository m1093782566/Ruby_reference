threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end
puts "Waiting"
sleep 0.1
puts "Done"
#produces:
#0
#2
#Waiting
#3
#Done


threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end
puts "Waiting"
threads.each do |t|
  begin
    t.join
  rescue RuntimeError => e
    puts "Failed: #{e.message}"
  end
end
puts "Done"
#produces:
#0
#Waiting
#2
#3
#Failed: Boom!
#Done


#However, set abort_on_exception to true or use -d to turn on the debug flag,
#and an unhandled exception kills the main thread, so the message Done never appears.
Thread.abort_on_exception = true
threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end
puts "Waiting"
threads.each {|t| t.join }
puts "Done"
#produces:
#0
#2
#prog.rb:4:in `block (2 levels) in <main>': Boom! (RuntimeError)
