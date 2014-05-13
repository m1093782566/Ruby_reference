def create_symlink(src, dst)
  # FileUtils doesn have 'no-deference' for links - causing ln_sf to
  # attempt to create target link in dst rather than to overwrite it.
  # BROKEN: FileUtils.ln_sf(src, dst)
  out = %x(ln -nsf #{src} #{dst} 2>&1)
  unless $?.exitstatus == 0
    raise Bosh::Agent::MessageHandlerError,
          "Failed to link '#{src}' to '#{dst}': #{out}"
  end
end
