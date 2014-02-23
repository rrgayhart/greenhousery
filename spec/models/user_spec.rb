require 'spec_helper'

describe User do
  
  xit 'should add geolocation on save' do
    user = User.new(email: 'example@example.com', street: '112 Main St.', city: 'New Orleans', state: 'LA', country: 'USA')
    user.latitude.should eq(nil)
    user.save
    user.latitude.should eq(29.8806539)
    user.longitude.should eq(-89.94404809999999)
  end

  it "should be able to have a project" do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project, user: user)
    user.projects.first.should eq(project)
  end

end
