# Removes all symlinks from blobs directory
def remove_symlinks #Dir[] is equivalent to Dir.glob(), both return mathed files
  Dir[File.join(@blobs_dir, "**", "*")].each do |file| #** means recursive, * means any file.
    FileUtils.rm_rf(file) if File.symlink?(file)
  end
end
