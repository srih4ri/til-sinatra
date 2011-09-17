require 'rubygems'

require 'sinatra'
require 'twitter'

before do
  @search = Twitter::Search.new
end

get '/' do
  @tiltweets = @search.hashtag("til").language("en").no_retweets.per_page(50)
  erb :til
end

get '/topics/:topic' do
  @tiltweets = @search.hashtag("til #{params[:topic]}").language("en").no_retweets.per_page(50)
  erb :til
end
