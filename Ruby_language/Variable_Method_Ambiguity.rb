def a
  puts "Function 'a' called"
  99
end

for i in 1..2
  if i == 2
    puts "i==2, a=#{a}"
  else
    a = 1
    puts "i==1, a=#{a}"
  end
end
#produces:
#i==1, a=1
#Function 'a' called
#i==2, a=99

#During the parse, Ruby sees the use of a in the first puts statement and, because it hasn't yet
#seen any assignment to a, assumes that it is a method call. By the time it gets to the second
#puts statement, though, it has seen an assignment and so treats a as a variable.

