require "sinatra"
require "sinatra/reloader" 
require 'rack/contrib'

class App < Sinatra::Base
  use Rack::Session::Cookie, 
    :key => 'sesskey',
    :path => '/',
    :secret => "rewrite_here",
    :expire_after => 60*60*24*30, # a month
    :coder => Rack::Session::Cookie::Base64::JSON.new

  configure do
    set :session_secret, "rewrite_here"
  end

  enable :sessions
  
  get "/" do
    erb :index
  end
  
end
