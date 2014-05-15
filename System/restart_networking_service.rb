#Reference https://github.com/cloudfoundry/bosh/blob/master/bosh_agent/lib/bosh_agent/platform/ubuntu/network.rb#L21
def restart_networking_service
  # ubuntu 10.04 networking startup/upstart stuff is quite borked
  networks.each do |k, v|
    interface = v['interface']
    @logger.info("Restarting #{interface}")
    output = sh("service network-interface stop INTERFACE=#{interface}").output
    output += sh("service network-interface start INTERFACE=#{interface}").output
    @logger.info("Restarted networking: #{output}")
  end
end
