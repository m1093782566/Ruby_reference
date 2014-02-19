#General Delimited Input, reference Programming Ruby p298

#Another example of "<<"
print <<HERE
Double quoted \
here document.
It is #{Time.now}
HERE

print <<-'THERE' #caution!
This is single quoted.
The above used #{Time.now}
THERE
#produces:
#Double quoted here document.
#It is 2013-05-27 12:31:31 -0500
#This is single quoted.
#The above used #{Time.now}
