require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pg'
require './lib/store'
require './lib/brand'

get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb :index
end

post '/stores' do
  name = params[:store_name]
  description = params[:store_description]
  address = params[:store_address]
  Store.create({name: name, description: description, address: address})
  redirect '/'
end

post '/brands' do
  name = params[:brand_name]
  description = params[:brand_description]
  Brand.create({name: name, description: description})
  redirect '/'
end

get '/stores/:id' do
  @store = Store.find(params[:id])
  erb :store
end

get '/brands/:id' do
  @brand = Brand.find(params[:id])
  erb :brand
end
