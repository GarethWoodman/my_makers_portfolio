require 'sinatra/base'
require 'json'

class ThermostatApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
     File.read('public/index.html')
  end
end
