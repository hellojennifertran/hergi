require 'net/http'
require 'uri'

class GetEvents
  def call
    # call api
    uri = URI.parse("https://api.predicthq.com/v1/events/")

    http = Net::HTTP.new(uri.host)
    request = Net::HTTP::Get.new(uri.request_uri)
    # request['Authorization'] = "Token AMfd48QtwsU4NAhvajb06jDCImAKnWBRSQFltp6q"
    response = http.request(request)
  end
end

p GetEvents.new.call
