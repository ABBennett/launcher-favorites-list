require 'sinatra'
require 'pry'
require 'csv'

get '/favorites-list' do
  @favorites = CSV.readlines('favorites_list.csv', headers: true)
  erb :index
end


post '/favorites-list' do
  favorite_thing = params["favorites-list"]

  unless favorite_thing.strip.empty?
    CSV.open('favorites_list.csv', 'a') do |file|
      file << [favorite_thing]
    end
  end

  redirect '/favorites-list'
end

get '/' do
  erb :index
end
