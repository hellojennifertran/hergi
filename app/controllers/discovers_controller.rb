class DiscoversController < ApplicationController
  def index
    query = "health"
    url = 'https://api.predicthq.com/v1/events'
    # token = '4qgQOYNjfU2vJKPv9JnRF2CTVnA24Kr2kiImdw3v'
    curl = `curl -X GET https://api.predicthq.com/v1/events/?q="${query}" \
    -H "Authorization: Bearer 4qgQOYNjfU2vJKPv9JnRF2CTVnA24Kr2kiImdw3v"`
    @events = JSON.parse(curl)
  end
end
