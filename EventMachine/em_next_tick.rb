require 'eventmachine'
EM.run do
  puts Time.now
  EM.add_periodic_timer(1) do
    puts Time.now
    puts "Hai"
  end
  EM.add_periodic_timer(1) do
    puts Time.now
    EM.next_tick do
      puts Time.now
        EM.stop_event_loop
    end
  end
end
