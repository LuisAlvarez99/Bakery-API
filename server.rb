require 'sinatra'
require 'curb'
require 'httparty'
require 'json'

@@path = 'https://api.edamam.com/search'

get '/' do
    erb :Home
end

get '/cake' do
    erb :cake
end

get '/muffins' do
    erb :muffins
end

get '/cookies' do
    erb :cookies
end

post '/' do
    req = Curl::Easy.perform(@@path + "?q=#{params[:food]}&app_id=#{ENV['EDAMAM_ID']}&app_key=#{ENV['EDAMAM_API']}&from=0&to=#{params[:to]}")
    res = JSON.parse(req.body)
    @arr = []
    x = 0
    while x < "#{params[:to]}".to_i
        @data = res["hits"][x]["recipe"]
        @arr << @data
        x += 1
    end
    puts @data  
    erb :food
<<<<<<< Updated upstream
=======
end


get '/cake' do
    "This is where you see cake"

end

get '/muffins' do
    "This is where you see Muffin"

end

get '/cookies' do
    "This is where you see cookie"

>>>>>>> Stashed changes
end