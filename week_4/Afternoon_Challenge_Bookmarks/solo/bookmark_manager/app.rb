require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb (:'all_bookmarks')
  end

  get "/bookmarks/new" do
    erb(:add_bookmarks)
  end

  post "/bookmarks" do
    p params
    Bookmark.create(url: params[:url], title: params[:title])
    redirect './bookmarks'
  end


  run! if app_file == $0
end
