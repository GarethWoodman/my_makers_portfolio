require 'sinatra/base'
require './lib/diary'
require 'pg'

class DailyDiary < Sinatra::Base
  # Tracelogs against Database queries
  enable :sessions, :method_override

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

  # Edit entry Form
  get '/entries/:id/edit' do
    @entry = Diary.find_entry(id: params[:id])
    erb :edit
  end

  # Update entry
  patch '/entries/:id' do
    @entry = Diary.find_entry(id: params[:id])
    @entry.update(title: params[:title], entry: params[:entry])
    redirect '/entries'
  end

  # Delete entry
  delete '/entries/:id' do
    @entry = Diary.find_entry(id: params[:id])
    @entry.delete
    redirect '/entries'
  end
end
