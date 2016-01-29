ENV['RACK_ENV'] = 'test'

require 'sinatra/activerecord'
require 'rspec'
require 'pg'
require 'store'
require 'brand'

RSpec.configure do |config|
  config.after(:each) do
    Store.all.each do |s|
      s.destroy
    end
    Brand.all.each do |b|
      b.destroy
    end
  end
end
