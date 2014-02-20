#Install the gem and you can use colorize method to specify the color you want
#http://colorize.rubyforge.org/files/README_txt.html
#require 'colorize'
#puts "This is blue".colorize( :blue )

#Or you can simply use the codes as you would in bash
def make_color(str, color)
  colors = {:red => 31, :green => 32, :yellow => 33, :blue => 34}
  puts "\e[#{colors[color]}m#{str}\e[0m" #you can replace str->self, so that you can call this method using: "String".make_color(:red)
end

make_color("string_to_be_colored", :red)
