#Reference https://github.com/cloudfoundry/bosh/blob/master/bosh_agent/lib/bosh_agent/util.rb#L174-L184 
def get_network_info
  sigar = SigarBox.create_sigar
  net_info = sigar.net_info
  ifconfig = sigar.net_interface_config(net_info.default_gateway_interface)

  properties = {}
  properties["ip"] = ifconfig.address
  properties["netmask"] = ifconfig.netmask
  properties["gateway"] = net_info.default_gateway
  properties
end
