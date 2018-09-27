require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all

    erb :bookmarks
  end
  get '/bookmarks/add' do
    erb (:'bookmarks/add')
  end

  post '/bookmarks' do
    @url = params[:url]
    Bookmark.add(@url)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
