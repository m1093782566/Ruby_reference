require 'erb'

SOURCE =
%{<% for number in min..max %>
The number is <%= number %>
<% end %>
}

erb = ERB.new(SOURCE)
min = 4
max = 6
puts erb.result(binding)
#produces:
#The number is 4
#The number is 5
#The number is 6
