require 'sinatra/base'



class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect'/bookmarks'
  end

  put '/bookmarks' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  get '/bookmarks/delete' do
    erb :'bookmarks/delete'
  end

  get '/bookmarks/find' do
    erb :'bookmarks/find'
  end

  post '/bookmarks/update' do
    @bookmark = Bookmark.find(title: params[:title])
    erb :'bookmarks/update'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
