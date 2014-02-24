require 'spec_helper'

describe ProjectArray do
  
  context 'on creation' do

    it 'should belong to a project' do
      user = FactoryGirl.create(:user)
      project = FactoryGirl.create(:project, user: user)
      project_array = FactoryGirl.create(:project_array, project: project)
      project.project_arrays.first.should eq(project_array)
      project_array.project.should eq(project)
    end
  end
end
