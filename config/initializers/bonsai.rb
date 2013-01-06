# this is required for elasticsearch on Heroku, using the Bonsai add on
if ENV['BONSAI_URL']
  ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']
end