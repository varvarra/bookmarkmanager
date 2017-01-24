require 'sinatra/base'

class Manager < Sinatra::Base

  get '/link' do
    erb :index
  end

end
