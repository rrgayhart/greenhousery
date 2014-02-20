require 'spec_helper'

describe "the signin process", :type => :feature do
  before :each do
    
  end

  it "gets geolocation data" do
    visit '/'
    within("#user-data") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Street', :with => '1001 Sherman St.'
      fill_in 'City', :with => 'Denver'
      fill_in 'State', :with => 'CO'
      fill_in 'Country', :with => 'USA'
    end
    click_link 'Start Planning'
    expect(page).to have_content 'Project Site'
  end
end
