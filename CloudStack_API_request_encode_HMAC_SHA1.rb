require 'base64'
require 'cgi'
require 'openssl'
require 'net/http'

apikey="zr_w86-A-2TsaDzgEUbJZ1PNICWv8L4H_ywHcIwgHX186nAbpHVn4c-FLuAbRjjzVt9r890HE-me_lNDc7yxMw"
command="listZones"
request = "apiKey=#{apikey}&command=#{command}".downcase!
signature = 'w4ZW_kQeEtmfbLOeBz6Pj39iHUdqlpnfYd62o7bSn3PK7uLElQHE0nCLLRU8i3fu72-vC1JxzmvuEEMxt6WwVQ'
result=Base64.encode64("#{OpenSSL::HMAC.digest('sha1',signature, request)}")
result.gsub!("=","%3D")

Net::HTTP.get_print URI("http://172.17.4.104:8080/client/api?command=listZones&apiKey=zr_w86-A-2TsaDzgEUbJZ1PNICWv8L4H_ywHcIwgHX186nAbpHVn4c-FLuAbRjjzVt9r890HE-me_lNDc7yxMw&signature=#{result}")
