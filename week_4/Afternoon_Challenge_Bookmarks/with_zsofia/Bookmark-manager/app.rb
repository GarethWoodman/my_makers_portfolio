require 'Sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/bookmarks' do
    # url = params['url']
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.all
    erb:'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

run! if app_file == $0

end
