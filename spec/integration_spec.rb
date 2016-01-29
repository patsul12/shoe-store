require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

feature 'add a store path' do
  scenario 'the user is able to fill out a store info on the home page to create a new one.' do
    visit '/'
    create_new_store
    expect(page).to have_content("test-store")
  end
end

feature 'add a brand path' do
  scenario 'the user is able to fill out a brand info on the home page to create a new one.' do
    visit '/'
    create_new_brand
    expect(page).to have_content("test-brand")
  end
end

feature 'add a brand to a store path' do
  scenario 'the user can add a brand to a given store, on the stores page' do
    visit '/'
    create_new_store
    create_new_brand
    click_link("test-store")
    click_link("test-brand")
    click_button "Add Brand"
    expect(page).to have_content("test-brand")
  end
end

def create_new_store
  fill_in("store_name", with: "test-store")
  fill_in("store_description", with: "test store description")
  fill_in("store_address", with: "test store address")
  click_button 'Create Store'
end

def create_new_brand
  fill_in("brand_name", with: "test-brand")
  fill_in("brand_description", with: "test brand description")
  click_button 'Create Brand'
end
