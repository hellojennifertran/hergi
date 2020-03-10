class DiscoversController < ApplicationController
  def index

    film_file = File.read(Rails.root.join('app/assets/json/film-response.json'))
    festivals_file = File.read(Rails.root.join('app/assets/json/london-festivals-response.json'))
    sports_file = File.read(Rails.root.join('app/assets/json/london-sports-active-life-response.json'))
    arts_file = File.read(Rails.root.join('app/assets/json/visual-arts-response.json'))

    @events = JSON.parse(film_file)
  end
end
