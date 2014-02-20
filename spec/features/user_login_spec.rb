require 'spec_helper'

describe "the signin process", :type => :feature do
  before :each do
    
  end

  it "gets geolocation data" do
    visit '/'
    within("#user-data") do
      fill_in 'user_email', :with => 'user@example.com'
      fill_in 'user_street', :with => '1001 Sherman St.'
      fill_in 'user_city', :with => 'Denver'
      fill_in 'user_state', :with => 'CO'
      fill_in 'user_country', :with => 'USA'
    end
    click_button 'Start Planning'
    expect(page).to have_content 'Project Site'
    expect(page).to have_content 'Latitude: 39.732238'
    expect(page).to have_content 'Longitude: -104.985251'
  end
end
