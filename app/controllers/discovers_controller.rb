class DiscoversController < ApplicationController
  def index

    film_json = File.read(Rails.root.join('app/assets/json/film-response.json'))
    festivals_json = File.read(Rails.root.join('app/assets/json/london-festivals-response.json'))
    sports_json = File.read(Rails.root.join('app/assets/json/london-sports-active-life-response.json'))
    arts_json = File.read(Rails.root.join('app/assets/json/visual-arts-response.json'))

    @events_health = JSON.parse(sports_json)
    @events_exploration = JSON.parse(arts_json)
    @events_relationships = JSON.parse(festivals_json)

  end
end
