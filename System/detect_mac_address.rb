#Reference https://github.com/cloudfoundry/bosh/blob/master/bosh_agent/lib/bosh_agent/platform/linux/network.rb#L74
def detect_mac_addresses
  mac_addresses = {}
  Dir['/sys/class/net/*'].each do |dev_path|
    dev = File.basename(dev_path)
    mac = File.read(File.join(dev_path, 'address')).strip
    mac_addresses[mac] = dev
  end
  mac_addresses
end
