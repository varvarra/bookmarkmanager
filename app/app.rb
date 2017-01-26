ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base


  get '/' do
    erb :index
  end

  get '/links' do
    #link1 = Link.create(title:(params[:title]),url:(params[:url]))
    @links = Link.all
    erb :links
  end

  post '/links' do
    @link = Link.create(title:params[:title],url:params[:url])
    redirect '/links'
  end

  get '/links/new' do
    erb :creating_links
  end

  run! if app_file == $0
end
