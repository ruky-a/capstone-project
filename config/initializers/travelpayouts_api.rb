TravelPayouts.configure do |config|
  config.token =  ENV['token']
  config.marker =  ENV['marker']
  config.host = 'localhost'
  config.currency = 'usd'
  config.locale = 'en'
end