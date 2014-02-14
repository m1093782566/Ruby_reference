count = 0
threads = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end

threads.each {|t| t.join; print t[:mycount], ", " }
puts "count = #{count}"
#produces:
#7, 0, 6, 8, 4, 5, 1, 9, 2, 3, count = 10
