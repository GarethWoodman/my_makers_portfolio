require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/days' do
    @name      = params[:name]
    @days_left = calculate_days(params[:month], params[:day])
    erb :birthday
  end

  private
  def calculate_days(month, day)
    current_year =  Time.new.year
    birthdate    =  Time.new(current_year, month, day)
    (birthdate - Time.new).to_i / (24 * 60 * 60)
  end

  run! if app_file == $0
end
