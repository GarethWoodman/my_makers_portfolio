require 'sinatra'

get '/' do
  @name = ["Amigo", "Oscar", "Viking"].sample
  erb(:index)
end

get '/secret' do
  "This is a secret"
end

get '/random-cat' do
  "<div style='border: 3px dashed red'>
  <img src='http://bit.ly/1eze8aE'
  </div>"
end

post '/named-cat' do
  p params[:name]
  @name = params[:name]
  erb(:index)
end

get '/cat-form' do
  erb(:index)
end
