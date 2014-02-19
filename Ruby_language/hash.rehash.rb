arr = [1, 2, 3]
hash = { arr => 'value' }
hash[arr] # => "value"
arr[1] = 99
hash      # => {[1, 99, 3]=>"value"}
hash[arr] # => nil
hash.rehash
hash[arr] # => "value"
#Because strings are the most frequently used keys and because string contents are often
#changed, Ruby treats string keys specially. If you use a String object as a hash key, the hash
#will duplicate the string internally and will use that copy as its key. The copy will be frozen.
#Any changes made to the original string will not affect the hash.
