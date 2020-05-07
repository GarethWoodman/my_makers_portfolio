require 'sinatra/base'
require './lib/diary'

class DailyDiary < Sinatra::Base
  get '/' do
  end

  get '/entries/new' do
    erb :add_entries
  end

  post '/submit_entry' do
    Diary.add(title: params[:title], entry: params[:entry])
    redirect '/entries'
  end

  get '/entries' do
    @diary = Diary.entries
    erb :entries
  end
end
