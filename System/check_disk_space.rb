require 'sys/filesystem'
include Sys

#check if space of a dir is enough
#bosh/bosh-director/lib/bosh/director/api/api_helper.rb
def check_available_disk_space(dir, size)
  begin
    stat = Sys::Filesystem.stat(dir)
    available_space = stat.block_size * stat.blocks_available
    available_space > size ? true : false
  rescue
    false
  end
end
