require 'spec_helper'

describe "the signin process", :type => :feature do
  before :each do
    
  end

  it "gets geolocation data" do
    visit '/'
    within("#user-data") do
      fill_in 'user_email', :with => 'user@example.com'
    end
    click_button 'Sign Up'
    
    click_button 'Start a New Project'
    within("#project-data") do
      fill_in 'project_name', :with => 'Small Solar Project'
      fill_in 'project_street', :with => '1001 Sherman St.'
      fill_in 'project_city', :with => 'Denver'
      select('Colorado', :from => 'state')
      fill_in 'project_country', :with => 'USA'
    end
    click_button 'Start Planning'

    expect(page).to have_content 'Small Solar Project'
    expect(page).to have_content 'Latitude: 39.732238'
    expect(page).to have_content 'Longitude: -104.985251'
  end
end
