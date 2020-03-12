class DiscoversController < ApplicationController

  before_action :read_files

  def index; end

  def saved
    @json_events = [@events_health, @events_exploration, @events_relationships]
    @all_events = {}
    @json_events.each do |json|
      json["events"].each do |event|
        @all_events["#{event['id']}"] = event
      end
    end

    @saved_events = 
      current_user.events
        .map { |event| @all_events["#{event}"] }
        .sort_by { |e| Date.parse(e['time_start'])}
  end

  private

  def read_files
    film_json = File.read(Rails.root.join('app/assets/json/film-response.json'))
    festivals_json = File.read(Rails.root.join('app/assets/json/london-festivals-response.json'))
    sports_json = File.read(Rails.root.join('app/assets/json/london-sports-active-life-response.json'))
    arts_json = File.read(Rails.root.join('app/assets/json/visual-arts-response.json'))

    @events_health = JSON.parse(sports_json)
    @events_exploration = JSON.parse(arts_json)
    @events_relationships = JSON.parse(festivals_json)
  end

end
