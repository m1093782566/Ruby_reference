def fibonacci_sequence
  Enumerator.new do |generator|
    i1, i2 = 1, 1
    loop do
      break if i1 > 20
      generator.yield i1
      i1, i2 = i2, i1+i2
    end
  end
end
puts fibonacci_sequence.first(10).inspect #output the first 10 elements
#you can also use irb, load absolute path of this file, load '/path/to/Enumerator_fibonacci_sequence.rb', replace puts
