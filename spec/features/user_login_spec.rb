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

  it 'can log in and log out' do
    visit '/'
    click_link 'Login'
    fill_in 'email', :with => 'example@example.com'
    fill_in 'password', :with => 'password'
    click_button 'Login'
    page.should have_content('Logout')
    click_link 'Logout'
    page.should have_content('Login')
  end
end

describe 'user signing up', :type => :feature do

  it "is automatically logged in" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user_email', :with => 'user@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content('Dashboard')
  end
end
