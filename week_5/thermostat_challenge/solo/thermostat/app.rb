require 'sinatra/base'
require 'json'

class ThermostatApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
     File.read('public/index.html')
  end

  get '/temperature' do

  end

  post '/temperature' do

  end

  post '/power-saving-mode' do

  end

  run! if app_file == $0
end
