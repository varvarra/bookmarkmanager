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
    erb :'links'
  end

  run! if app_file == $0
end
