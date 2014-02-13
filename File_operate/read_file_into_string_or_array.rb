# read into string
str = IO.read("testfile")
str.length # => 66
str[0, 30] # => "This is line one\nThis is line "
# read into an array
arr = IO.readlines("testfile")
arr.length # => 4
arr[0]
# => "This is line one\n"
