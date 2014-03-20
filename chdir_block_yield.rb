in_build_dir do
  FileUtils.mkdir("packages")
  FileUtils.mkdir("jobs")
end

def in_build_dir(&block)
  Dir.chdir(build_dir) { yield }
end
