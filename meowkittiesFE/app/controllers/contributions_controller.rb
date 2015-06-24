require 'httparty'

get '/' do
  erb :'contributions/index'
end

get '/contributions' do
  p "*" * 100
  p params
  p "*" * 100
response = HTTParty.get("http://localhost:3000", :query => {searchterm: params[:searchterm]})
  @abc = response.body
  erb :'contributions/new'
end
