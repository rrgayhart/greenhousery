require 'spec_helper'

describe ProjectArray do
    let(:user) { FactoryGirl.create(:user) }  
    let(:project) { FactoryGirl.create(:project) }

  context 'creating points' do
    let(:project_array) { FactoryGirl.create(:project_array, project: project) }
    
    it 'should handle receiving length or width, shape and square foot' do
      project_array.set_points({length: 10, shape:'rectange', square_foot: 200})
      project_array.points.count.should eq(4)
      project_array.points.first.x_coordinate.should eq(0)
      project_array.points.first.y_coordinate.should eq(0)
      project_array.points.last.x_coordinate.to_i.should eq(20)
      project_array.points.last.y_coordinate.to_i.should eq(10)
    end
  end

  context 'on creation' do

    let(:project_array) { FactoryGirl.build(:project_array, project: project) }

    it 'should set_name on save' do
      project_array.name.should eq(nil)
      project_array.save
      project_array.name.should eq('Basic Solar Project Array')
    end

    it 'should not set_name if name exists' do
      project_array.name = 'My Array'
      project_array.save
      project_array.name.should eq('My Array')
    end

    it 'should belong to a project' do
      project_array.save
      project.project_arrays.first.should eq(project_array)
      project_array.project.should eq(project)
    end

    it 'should have points' do
      project_array.save
      project_array.points.count.should eq(0)
    end
  end
end
