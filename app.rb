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
  store = Store.create({name: name, description: description, address: address})
  if store.errors.any?
    @stores = Store.all
    @brands = Brand.all
    @errors = store.errors
    erb :index
  else
    redirect '/'
  end
end

post '/brands' do
  name = params[:brand_name]
  description = params[:brand_description]
  brand = Brand.create({name: name, description: description})
  if brand.errors.any?
    @stores = Store.all
    @brands = Brand.all
    @errors = brand.errors
    erb :index
  else
    redirect '/'
  end
end

get '/stores/:id' do
  @store = Store.find(params[:id])
  @brands = Brand.all
  erb :store
end

post '/stores/:id/brands' do
  store = Store.find(params[:id])
  brand = Brand.find_by(name: params[:brand_name])
  if !store.brands.exists?(brand.id)
    store.brands.push(brand)
  end
  redirect "/stores/#{store.id}"
end

delete '/stores/:id/brands' do
  store = Store.find(params[:id])
  brand = Brand.find(params[:brand_id])
  store.brands.delete(brand)
  redirect "/stores/#{store.id}"
end

get '/brands/:id' do
  @brand = Brand.find(params[:id])
  @stores = Store.all
  erb :brand
end

post '/brands/:id/brands' do
  brand = Brand.find(params[:id])
  store = Store.find_by(name: params[:store_name])
  if !brand.stores.exists?(store.id)
    brand.stores.push(store)
  end
  redirect "/brands/#{brand.id}"
end

delete '/brands/:id/stores' do
  brand = Brand.find(params[:id])
  store = Store.find(params[:store_id])
  brand.stores.delete(store)
  redirect "/brands/#{brand.id}"
end
