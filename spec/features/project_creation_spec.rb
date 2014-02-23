require 'spec_helper'

describe "starting a new project", :type => :feature do
  before :each do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'email', :with => 'example@example.com'
    fill_in 'password', :with => 'password'
    click_button 'Login'
  end

  it 'can create a new project' do
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

    click_link 'Dashboard'
    expect(page).to have_link 'Small Solar Project'
    click_link 'Small Solar Project'
    expect(page).to have_content 'Latitude: 39.732238'
  end
end
