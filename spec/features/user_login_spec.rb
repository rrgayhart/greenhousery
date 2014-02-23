require 'spec_helper'

describe "existing user in the signin process", :type => :feature do
  before :each do
   user = FactoryGirl.create(:user) 
  end

  it 'is directed to the welcome page' do
    visit '/'
    page.should have_content('Sign Up')
    page.should have_content('Login')
    page.should have_no_content('Logout')
  end

  it 'can log in'
    #assert page has log in
    #log in
    #assert page does not have log in
  it 'can log out'

end

describe 'the project process', :type => :feature do

  it "provides geolocation data" do
    visit '/'
    click_link 'Sign Up'
    within("#user-data") do
      fill_in 'user_email', :with => 'user@example.com'
      fill_in 'user_password', :with => 'password'
      fill_in 'user_confirmation', :with => 'password'
      click_button 'Sign Up'
    end

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
