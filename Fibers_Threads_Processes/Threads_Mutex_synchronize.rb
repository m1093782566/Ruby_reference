sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.synchronize do #like lock&unlock
        new_value = sum + 1
        print "#{new_value} " if new_value % 250_000 == 0
        sum = new_value
      end
    end
  end
end

threads.each(&:join)
puts "\nsum = #{sum}"
#produces:
#250000 500000 750000 100000
#sum = 1000000
