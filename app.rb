require 'sinatra/base'

class Manager < Sinatra::Base

  get '/' do
    erb :index
  end

end
