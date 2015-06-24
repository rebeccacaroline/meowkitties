require 'httparty'

get '/' do


  erb :'contributions/index'
end

get '/contributions' do

response = HTTParty.get("http://localhost:3000")

  @abc = response.body

  erb :'contributions/new'
end
