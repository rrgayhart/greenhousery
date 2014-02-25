require 'spec_helper'

describe NrelCall do
  
  context 'making a call' do
    before :each do
      Key.create(:service => 'NREL', :key => 'fjsagihg')
    end

    it 'should have a key' do
      nrel = NrelCall.new({})
      #nrel.key.should eq('fjsagihg')
    end

    it 'should format the solar resource address' do
      nrel = NrelCall.new({:lat => '20', :lon => '-105'})
      http = "http://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=fjsagihg&lat=20&lon=-105"
      nrel.solar_resource_address.should eq(http)
    end

    
  end
end
