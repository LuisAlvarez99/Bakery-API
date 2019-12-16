require 'sinatra'
require 'curb'
require 'httparty'
require 'json'

@@path = 'https://api.edamam.com/search'

get '/' do
    erb :Home
end

post '/' do
    @food = params['food']
    @num = params['to'].to_i
    req = Curl::Easy.perform(@@path + "?q=#{@food}&app_id=a2d96ba1&app_key=3e4694ce3477d438bf0a3c273eafd9e3&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
    res = JSON.parse(req.body)
    @arr = []
    x = 0
    while x < @num
        @data = res["hits"][x]["recipe"]
        @arr << @data
        x += 1
    end
    puts @data  
    erb :food
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