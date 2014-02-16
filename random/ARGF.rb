#You can get to the name of the file currently being read from using ARGF.filename, and you
#can get the current File object as ARGF.file. ARGF keeps track of the total number of lines read
#in ARGF.lineno—if you need the line number in the current file, use ARGV.file.lineno. Here’s a
#program that uses this information:

while line = gets
  printf "%d: %10s[%d] %s", ARGF.lineno, ARGF.filename, ARGF.file.lineno, line
end

#If we run it, passing a couple of file names, it will copy the contents of those files.
#$ ruby copy.rb testfile otherfile
#1: testfile[1] This is line one
#2: testfile[2] This is line two
#3: testfile[3] This is line three
#4: testfile[4] And so on...
#5: otherfile[1] ANOTHER LINE ONE
#6: otherfile[2] AND ANOTHER LINE TWO
#7: otherfile[3] AND FINALLY THE LAST LINE
