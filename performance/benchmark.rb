require 'benchmark'

n = 50000
Benchmark.bm do |x|
  x.report { for i in 1..n; a = "1"; end }
  x.report { n.times do   ; a = "1"; end }
  x.report { 1.upto(n) do ; a = "1"; end }
end

=begin
The result:
Rehearsal -----------------------------------------
sort!  11.928000   0.010000  11.938000 ( 12.756000)
sort   13.048000   0.020000  13.068000 ( 13.857000)
------------------------------- total: 25.006000sec

            user     system      total        real
sort!  12.959000   0.010000  12.969000 ( 13.793000)
sort   12.007000   0.000000  12.007000 ( 12.791000)
=end

require 'benchmark'
include Benchmark         # we need the CAPTION and FORMAT constants

#benchmark(caption = "", label_width = nil, format = nil, *labels)
n = 50000
Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  tf = x.report("for:")   { for i in 1..n; a = "1"; end }
  tt = x.report("times:") { n.times do   ; a = "1"; end }
  tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  [tf+tt+tu, (tf+tt+tu)/3]
end

=begin
user     system      total        real
for:     1.016667   0.016667   1.033333 (  0.485749)
times:   1.450000   0.016667   1.466667 (  0.681367)
upto:    1.533333   0.000000   1.533333 (  0.722166)
>total:  4.000000   0.033333   4.033333 (  1.889282)
>avg:    1.333333   0.011111   1.344444 (  0.629761)
=end

#The times for some benchmarks depend on the order in which items are run.
#These differences are due to the cost of memory allocation and garbage collection.
#To avoid these discrepancies, the bmbm method is provided. For example, to compare ways to sort an array of floats:
require 'benchmark'

array = (1..1000000).map { rand }

Benchmark.bmbm do |x| #execute benchmark twice
  x.report("sort!") { array.dup.sort! }
  x.report("sort")  { array.dup.sort  }
end
=begin
The result:
Rehearsal -----------------------------------------
sort!  11.928000   0.010000  11.938000 ( 12.756000)
sort   13.048000   0.020000  13.068000 ( 13.857000)
------------------------------- total: 25.006000sec

            user     system      total        real
sort!  12.959000   0.010000  12.969000 ( 13.793000)
sort   12.007000   0.000000  12.007000 ( 12.791000)
=end
