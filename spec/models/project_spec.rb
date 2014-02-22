require 'spec_helper'

describe Project do
  
  context 'on creation' do

    let(:user) {  FactoryGirl.create(:user) }

    it 'should add geolocation on save' do
      project = Project.new(name:'Solar Installation', street: '112 Main St.', 
                city: 'New Orleans', state: 'LA', country: 'USA')
      project.latitude.should eq(nil)
      project.save
      project.latitude.should eq(29.8806539)
      project.longitude.should eq(-89.94404809999999)
    end
  
    it 'should belong to a user' do
      project = FactoryGirl.build(:project)
      project.user = user
      project.save
      project.user.should eq(user)
    end
  end
end
    
