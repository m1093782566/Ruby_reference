#Reference https://github.com/cloudfoundry/bosh/blob/master/bosh_agent/lib/bosh_agent/platform/ubuntu/network.rb#L62
def restart_dhclient
  sh("pkill dhclient3", :on_error => :return)
  sh("/etc/init.d/networking restart", :on_error => :return)
end
