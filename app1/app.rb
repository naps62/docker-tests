require 'sinatra/base'

class App1 < Sinatra::Base
  get '/' do
    'App 1'
  end
end
