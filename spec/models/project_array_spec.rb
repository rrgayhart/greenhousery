require 'spec_helper'

describe ProjectArray do
  
  context 'on creation' do
    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }

    it 'should set_name on save' do
      project_array = FactoryGirl.build(:project_array, project: project)
      project_array.name.should eq(nil)
      project_array.save
      project_array.name.should eq('Basic Solar Project Array')
    end

    it 'should not set_name if name exists' do
      project_array = FactoryGirl.build(:project_array, project: project, name: 'My Array')
      project_array.save
      project_array.name.should eq('My Array')
    end

    it 'should belong to a project' do
      project_array = FactoryGirl.create(:project_array, project: project)
      project.project_arrays.first.should eq(project_array)
      project_array.project.should eq(project)
    end

    it 'should have points' do
      project_array = FactoryGirl.create(:project_array, project: project)
      project_array.points.count.should eq(0)
    end
  end
end
