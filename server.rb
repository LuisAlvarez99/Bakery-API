require 'sinatra'
require 'httparty'

@@path = 'https://api.edamam.com/search'

get '/' do
    erb :Home
end

post '/' do
    @p = params['food']
    req = HTTParty.get(@@path, query: {app_id:ENV['EDAMAM_API_ID'],app_key:ENV['EDAMAM_API_KEY'],cuisineType:@p})
    # @res = JSON.parse(req.body)
    puts req 
end