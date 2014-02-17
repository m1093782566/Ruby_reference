require 'coverage'
Coverage.start
STDOUT.reopen("/dev/null")
require_relative 'to_be_test' #or 'to_be_test.rb'
Coverage.result.each do |file_name, counts|
  File.readlines(file_name).each.with_index do |code_line, line_number|
    count = counts[line_number] || "--"
    STDERR.printf "%3s: %s", count, code_line
  end
end
#coverage, measuring the coverage of your codes.
#reference programming ruby p740
#some filters like CoverMe and simplecov wrap this low-level funcitonality and output results with HTML format.
