require 'capybara/rspec'
require './app'
require 'database_cleaner'

Capybara.app = Sinatra::Application
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :chrome

RSpec.configure do |config|
  config.after(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end

set(:show_exceptions, false)

feature 'add a store path' do
  scenario 'the user is able to fill out a store info on the home page to create a new one.' do
    visit '/'
    create_new_store
    expect(page).to have_content("Test-store")
  end
end

feature 'add a brand path' do
  scenario 'the user is able to fill out a brand info on the home page to create a new one.' do
    visit '/'
    create_new_brand
    expect(page).to have_content("Test-brand")
  end
end

feature 'add a brand to a store path', js: true do
  scenario 'the user can add a brand to a given store, on the stores page' do
    visit '/'
    create_new_store
    create_new_brand
    add_brand_to_store
    expect(page).to have_content("Test-brand")
  end
end

feature 'remove a brand from a store path', js: true do
  scenario 'the user can remove a brand from a given store' do
    visit '/'
    create_new_store
    create_new_brand
    add_brand_to_store
    click_button 'delete Test-brand'
    expect(page).not_to have_content("Test-brand")
  end
end

def create_new_store
  fill_in("store_name", with: "Test-store")
  fill_in("store_description", with: "Test store description")
  fill_in("store_address", with: "Test store address")
  click_button 'Create Store'
end

def create_new_brand
  fill_in("brand_name", with: "Test-brand")
  fill_in("brand_description", with: "Test brand description")
  click_button 'Create Brand'
end

def add_brand_to_store
  click_link("Test-store")
  click_button "dropdown"
  click_link("Test-brand")
  click_button "Add Brand"
end
