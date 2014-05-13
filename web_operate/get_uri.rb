# Sends GET request to an specified URI.

# @param [String] uri URI to request
# @return [String] Response body
def get_uri(uri)
  client = HTTPClient.new
  client.send_timeout = HTTP_API_TIMEOUT
  client.receive_timeout = HTTP_API_TIMEOUT
  client.connect_timeout = HTTP_CONNECT_TIMEOUT

  headers = {"Accept" => "application/json"}
  response = client.get(uri, {}, headers)
  unless response.status == 200
    raise LoadSettingsError, "Endpoint #{uri} returned HTTP #{response.status}"
  end

  response.body
rescue HTTPClient::TimeoutError
  raise LoadSettingsError, "Timed out reading endpoint #{uri}"
rescue HTTPClient::BadResponseError => e
  raise LoadSettingsError, "Received bad HTTP response from endpoint #{uri}: #{e.inspect}"
rescue URI::Error, SocketError, Errno::ECONNREFUSED, SystemCallError => e
  raise LoadSettingsError, "Error requesting endpoint #{uri}: #{e.inspect}"
end
