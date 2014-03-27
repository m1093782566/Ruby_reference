good_matches = matches.sort { |a, b| a.usage <=> b.usage }

good_matches.sort! do |a, b|
  cmp = (b.keywords & keywords).size <=> (a.keywords & keywords).size
  cmp = (a.usage <=> b.usage) if cmp == 0
  cmp
end
#You can also include the module Comparable in your class which will automatically define for you the following methods: between?, ==, >=, <, <= and >.
