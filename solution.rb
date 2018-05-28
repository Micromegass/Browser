require 'sinatra'
require 'json'
require 'httparty'


get '/view-headers' do
  content_type :text
  puts JSON.pretty_generate(request.env)
end



class APIClient
  include HTTParty

  # Standard Sinatra address
  base_uri "127.0.0.1:4567"

  # This is a method to build your header based on the requirements of the API
  def build_header
    "This is the header method that I'm trying to test"
  end

  def test_header_in_request
    uri = "/view-headers"
    auth_header = build_headers
    headers = { "Test-Header-Name" => auth_header }
    self.class.get(uri, headers: headers)
  end
end