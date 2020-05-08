require 'sinatra/base'
require './lib/diary'

class DailyDiary < Sinatra::Base
  get '/entries' do
    @entries = Diary.entries
    erb :index
  end

  get '/entries/new' do
    erb :new
  end

  post '/entries' do
    Diary.add(title: params[:title], entry: params[:entry])
    redirect '/entries'
  end

  get '/entries/:id' do
    @entry = Diary.find_entry_by(id: params[:id])
    erb :show
  end
end
