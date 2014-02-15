require 'filetuils'
files = Dir['*~'] #list files in current dir -- no recursive
FileUtils::rm files, verbose: true

#We can also package this code as a Rake take. By default, Rake searches
#the current dir (and its parents) for a file called Rakefile.
#So, put the following code into a file called Rakefile:
desc "rm files whose names end with a tilde in current dir"
task :delete_unix_backups do
  files =Dir['*~']
  rm(files, verbose: true) unless #show execution details, all the methods in FileUtils are automatically available inside Rake files.
end
#usage: rake delete_unix_backups
