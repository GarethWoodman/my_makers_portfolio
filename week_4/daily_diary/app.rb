require 'sinatra/base'
require './lib/diary'

class DailyDiary < Sinatra::Base

  # Show all entries
  get '/entries' do
    @entries = Diary.entries
    erb :index
  end

  # Form to add new entires
  get '/entries/new' do
    erb :new
  end

  # Submitted Form, adds entry
  post '/entries' do
    Diary.add_entry(title: params[:title], entry: params[:entry])
    redirect '/entries'
  end

  # Get Entry by id
  get '/entries/:id' do
    @entry = Diary.find_entry(id: params[:id])
    erb :show
  end
end
