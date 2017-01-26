ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
       @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/links' do
    #link1 = Link.create(title:(params[:title]),url:(params[:url]))
    @links = Link.all
    @user = User.last
    $user_count = 1
    erb :links
  end

  post '/links' do
    link = Link.new(title:params[:title],
                     url: params[:url])

    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :creating_links
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    @user = User.last
    erb :links
  end

  post '/register' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  run! if app_file == $0
end
