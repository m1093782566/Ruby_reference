require 'open-uri'
page = open('http://pragprog.com/titles/ruby3/programming-ruby-1-9').read
if page =~ %r{<title>(.*?)</title>}m
puts "Title is #{$1.inspect}"
end

#produces:
#Title is "The Pragmatic Bookshelf | Programming Ruby 1.9"

#$1 is a global variable which can be used in later code:
#if "foobar" =~ /foo(.*)/ then
#  puts "The matching word was #{$1}"
#end
#(prints "The matching word was bar"))
