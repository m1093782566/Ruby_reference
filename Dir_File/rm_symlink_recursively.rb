# Remove all symlink targets
Dir.glob(File.join(dir, "*")).each do |f|
  if File.symlink?(f)
    logger.info("Removing monit symlink target file: " +
                "#{File.readlink(f)}")
    FileUtils.rm_rf(File.readlink(f))
  end
end
