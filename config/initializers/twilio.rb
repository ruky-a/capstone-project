Twilio.configure do |config| 
 config.account_sid =  ENV['twilio_account_sid']
config.auth_token = ENV['twilio_auth_token']
end









# Twilio.configure do |config|
#   config.account_sid = 'AC5d18e30bd7f8d1e3fa42bb43d373167e'
#   config.auth_token = '18d6765c150e1bf979a475e331a49e09'