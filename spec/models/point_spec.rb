require 'spec_helper'

describe Point do
  
  context 'on creation' do
    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:project_array) { FactoryGirl.create(:project_array, project: project) }

    it 'should belong to a project' do
      point = FactoryGirl.create(:point, project_array: project_array)
      point.project_array.should eq(project_array)
    end

    
  end
end
