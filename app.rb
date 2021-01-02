require 'sinatra/flash'
require 'sinatra/base'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get "/" do
    redirect "/bookmarks"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post "/bookmarks" do
    flash[:warning] = "Invalid URL" unless Bookmark.create(title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect "/bookmarks"
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect "/bookmarks"
  end

  get "/bookmarks/new" do
    erb :'bookmarks/new'
  end

  get "/bookmarks/delete" do
    erb :'bookmarks/delete'
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  get "/bookmarks/:id/comments/new" do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post "/bookmarks/:id/comments" do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
