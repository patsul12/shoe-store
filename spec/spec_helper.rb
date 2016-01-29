ENV['RACK_ENV'] = 'test'

require 'database_cleaner'
require 'sinatra/activerecord'
require 'rspec'
require 'pg'
require 'store'
require 'brand'

RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end

def create_store(name = nil, description = nil, address = nil)
  return Store.create({name: name, description: description, address: address })
end

def create_brand(name = nil, description = nil)
  return Brand.create({name: name, description: description})
end
