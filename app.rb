require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.create(params[:title], params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks' do
    
    Bookmark.delete(params[:title], params[:url])
    redirect'/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end


  get '/bookmarks/delete' do
    erb :'bookmarks/delete'
  end
  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
