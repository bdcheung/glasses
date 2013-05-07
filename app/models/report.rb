class Report < ActiveRecord::Base
  attr_accessible :location
  validates_presence_of :location

  require 'geoplanet'
  GeoPlanet.appid = "I22yVmDV34G_SCBRk0NHKXjuMe9bxnhNQRW27lY1rqn0ta.L8vKUx5TxM3v9yOtMbp9kpDrew8XJ"

  def geoplanet_location
    if location.to_i > 0
      geoplanet_location = GeoPlanet::Place.search(location.to_s)
    else
      geoplanet_location = GeoPlanet::Place.search(location.to_s, count: 5)
    end
  end


  def client
   client = Weatherman::Client.new
  end

  def woeid
    woeid = woeid || geoplanet_location.first.woeid
  end

  def response
    @response = client.lookup_by_woeid(woeid)
  end

  def forecast
    forecast = response.forecasts.first
  end

  def sunny?
    forecast['text'].downcase.include?("sun") || forecast['text'].downcase.include?("clear")
  end
  def daytime?
    response.condition['date'].hour >= response.astronomy['sunrise'].to_i && response.condition['date'].hour <= (response.astronomy['sunset'].to_i + 12)
  end
end
