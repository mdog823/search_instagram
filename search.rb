require 'rubygems'
require 'instagram'
require 'sinatra'

enable :sessions

#Instagram is picky about this URL
CALLBACK_URL = "http://localhost:9393/oauth/callback"

before do
end

Instagram.configure do |config|
  config.client_id = ""
  config.client_secret = ""
end

get '/' do
  erb :form
end

get '/search' do
  erb :form
end

post '/search' do
  html = ""
  for media_item in Instagram.tag_recent_media("#{params[:message]}")
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html << '<form action="/search" method="post"> <input type="text" name="message"> <input type="submit"> </form>'
  html
end
