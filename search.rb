require 'rubygems'
require 'instagram'
require 'sinatra'

enable :sessions

#Instagram is picky about this URL
CALLBACK_URL = "http://localhost:9393/oauth/callback"

before do
end

Instagram.configure do |config|
  config.client_id = "f0e802bf7a5e4ac8b0176642f703b44d"
  config.client_secret = "c8a8c76307524ddebaee319f0cf98e95"
end

get '/search' do
  erb :form
end

post '/search' do
  html = ""
  for media_item in Instagram.tag_recent_media("#{params[:message]}")
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html 
end