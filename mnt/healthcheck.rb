require 'net/http'

url = URI.parse(ENV["HEALTHCHECK_ENDPOINT"]) 
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https') 

request = Net::HTTP::Get.new(url)

response = http.request(request)

if response.code.to_i == 200
  exit 0
else
  puts "Health check failed... [status: #{response.code}]"
  exit 1
end
