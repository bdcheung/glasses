class Report < ActiveRecord::Base
  attr_accessible :location
  validates_presence_of :location

  require 'geoplanet'
  GeoPlanet.appid = "I22yVmDV34G_SCBRk0NHKXjuMe9bxnhNQRW27lY1rqn0ta.L8vKUx5TxM3v9yOtMbp9kpDrew8XJ"

  def geoplanet_location
    geoplanet_location = GeoPlanet::Place.search(location.to_s).first
  end

  def caps
  	location.to_s.upcase
  end

  def client
  	client = Weatherman::Client.new
  end

  def response
  	response = client.lookup_by_woeid(geoplanet_location.woeid)
  end

  def forecast
    forecast = response.forecasts.first
  end

  def sunny?
  	forecast['text'].downcase.include?("sun") || forecast['text'].downcase.include?("clear")
  end
end
