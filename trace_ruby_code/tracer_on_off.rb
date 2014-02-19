require 'tracer'

class A
  def square(a)
    @b = a*a
    result
  end
  def result
    @b
  end
end

Tracer.on

a = A.new
puts a.square(5)

Tracer.off

#produces:
#(arup~>Ruby)$ ruby test.rb
#0:test.rb:15::-: a = A.new
#0:test.rb:16::-: puts a.square(5)
#0:test.rb:4:A:>:   def square(a)
#0:test.rb:5:A:-:     @b = a*a
#0:test.rb:6:A:-:     result
#0:test.rb:8:A:>:   def result
#0:test.rb:9:A:-:     @b
#0:test.rb:10:A:<:   end
#0:test.rb:7:A:<:   end
#25
#0:test.rb:18::-: Tracer.off
