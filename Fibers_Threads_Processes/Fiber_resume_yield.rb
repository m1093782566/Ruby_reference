#pass args between yield and resume
f=Fiber.new do |a,b|
  Fiber.yield a+b,a-b
  #puts "a=#{a},b=#{b}"
  p a,b
end
p "outside:#{f.resume(10,10)}"
p "outside:#{f.resume(3,4)}"
