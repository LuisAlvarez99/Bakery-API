require 'sinatra'
require 'curb'
require 'httparty'
require 'json'

@@path = 'https://api.edamam.com/search'

get '/' do
    erb :Home, :layout => :base
end

get '/cake' do
    req1 = Curl::Easy.perform(@@path + "?q=cake&app_id=#{ENV['EDAMAM_ID']}&app_key=#{ENV['EDAMAM_API']}&from=0&to=9")
    res1 = JSON.parse(req1.body)
    @arrK = []
    x = 0
    while x < 9
        @arrK << res1["hits"][x]["recipe"]
        x += 1
    end
    puts @dataK  
    erb :cake

end

get '/muffins' do
    req2 = Curl::Easy.perform(@@path + "?q=muffin&app_id=#{ENV['EDAMAM_ID']}&app_key=#{ENV['EDAMAM_API']}&from=0&to=9")
    res2 = JSON.parse(req2.body)
    @arrM = []
    x = 0
    while x < 9
        @arrM << res2["hits"][x]["recipe"]
        x += 1
    end
    puts @dataM
    erb :muffins

end

get '/cookies' do
    req3 = Curl::Easy.perform(@@path + "?q=cookie&app_id=#{ENV['EDAMAM_ID']}&app_key=#{ENV['EDAMAM_API']}&from=0&to=9")
    res3 = JSON.parse(req3.body)
    @arrC = []
    x = 0
    while x < 9
        @arrC << res3["hits"][x]["recipe"]
        x += 1
    end
    puts @dataC
    erb :cookies

end

post '/' do
    req4 = Curl::Easy.perform(@@path + "?q=#{params[:food]}&app_id=#{ENV['EDAMAM_ID']}&app_key=#{ENV['EDAMAM_API']}&from=0&to=#{params[:to]}")
    res4 = JSON.parse(req4.body)
    @arrF = []
    x = 0
    while x < "#{params[:to]}".to_i
        @dataF = res4["hits"][x]["recipe"]
        @arrF << @dataF
        x += 1
    end
    puts @dataF  
    erb :food, :layout => :base
end

