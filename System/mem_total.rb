def mem_total
  # MemTotal:        3952180 kB
  File.readlines('/proc/meminfo').first.split(/\s+/)[1].to_i
end
