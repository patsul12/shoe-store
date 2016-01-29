require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

feature 'add a store path' do
  scenario 'the user is able to fill out a store info on the home page to create a new one.' do
    visit '/'
    fill_in_store
    click_button 'Create Store'
    expect(page).to have_content("test store")
  end
end

def fill_in_store
  fill_in("store_name", with: "test store")
  fill_in("store_description", with: "test store description")
  fill_in("store_address", with: "test store address")
end
