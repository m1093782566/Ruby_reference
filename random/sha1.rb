require 'digest/sha1'

my_sha = Digest::SHA1.file(blob_path).hexdigest
