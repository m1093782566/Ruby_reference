def is_tgz?(path)
  File.extname(path) == '.tgz' #return the extension of a file
end
#or:
#path='xxx.tar.gz'
#path.end_with?('.tar.gz')
#end.with? is a String method

#mkdir
FileUtils.mkdir("/path/to/dir")
#mkdir -p
FileUtils.mkdir_p("/path/to/dir")

#File.expand_path(relative_path, base_dir)
#Converts a pathname to an absolute pathname.
File.expand_path("~/oracle/bin")           #=> "/home/oracle/bin"
File.expand_path("../../bin", "/tmp/x")   #=> "/bin", according to /tmp/x

File.directory?('path/to/file_or_dir')

File.file?("path/to/file")

File.exist?("/path/to/file")

File.join("dir","file")
