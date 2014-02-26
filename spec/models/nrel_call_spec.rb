require 'spec_helper'

describe NrelCall do
  
  context 'making a call' do
    before :each do
      @key = Key.create(:service => 'NREL', :key => 'fakekey')
    end

    it 'should have a key' do
      nrel = NrelCall.new({})
      #nrel.key.should eq('fjsagihg')
    end

    it 'should format the solar resource address' do
      nrel = NrelCall.new({:lat => '20', :lon => '-105'})
      http = "http://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=#{@key.key}&lat=20&lon=-105"
      nrel.solar_resource_address.should eq(http)
    end

    xit 'should get results', :vcr do
      nrel = NrelCall.new({:lat => '35', :lon => '-105'})
      nrel.get_data.should eq('boo')
    end

    it 'should format the pvwatts address' do
      nrel = NrelCall.new({:lat => '35', :lon => '-105'})
      url = "http://developer.nrel.gov/api/pvwatts/v4.json?api_key=#{@key.key}&lat=35&lon=-105&system_size=4"
      nrel.pvwatts_address({:system_size => '4'}).should eq(url)
    end

    xit 'should get pvwatts results', :vcr do
      nrel = NrelCall.new({:lat => '35', :lon => '-105'})
      nrel.get_pvwatts({:system_size => '4'}).should eq('boo')
    end

    
  end
end
