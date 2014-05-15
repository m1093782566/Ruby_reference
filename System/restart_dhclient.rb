def restart_dhclient
  sh("pkill dhclient3", :on_error => :return)
  sh("/etc/init.d/networking restart", :on_error => :return)
end
