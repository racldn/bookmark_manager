require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'


class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    url = params[:url]
    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.add(url)
    else
      flash[:notice] = "Invalid input"
    end
    # fail 'Invalid input' unless url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    # Bookmark.add(url)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
