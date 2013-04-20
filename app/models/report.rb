class Report < ActiveRecord::Base
  attr_accessible :location

  def caps
  	location.to_s.upcase
  end

  def client
  	client = Weatherman::Client.new
  end

  def weather
  	weather = client.lookup_by_location(location.to_s)
  end

  def forecast
    forecast = weather.forecasts.first
  end

  def sunny?
  	forecast['text'].downcase.include? 'sun'
  end
end
