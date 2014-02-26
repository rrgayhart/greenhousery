require 'faraday'
require 'json'

class NrelCall
  attr_reader :key, :lat, :lon

  def initialize(args)
    @key = Key.where(:service => 'NREL').first.key
    @lat = args[:lat]
    @lon = args[:lon]
  end

  def solar_resource_address
    "http://developer.nrel.gov/api/solar/solar_resource/v1.json?api_key=#{key}&lat=#{lat}&lon=#{lon}"
  end

  def solar_data_address
    "http://developer.nrel.gov/api/solar/data_query/v1.json?api_key=#{key}&lat=#{lat}&lon=#{lon}"
  end

  def pvwatts_address(args)
    "http://developer.nrel.gov/api/pvwatts/v4.json?api_key=#{key}&lat=#{lat}&lon=#{lon}&system_size=#{args[:system_size]}"
  end

  def make_call(url)
    response = Faraday.get(url)
    JSON.parse(response.body)
  end

  def get_pvwatts(args)
    url = pvwatts_address(args)
    response = make_call(url)
    response['outputs']
  end

  def get_resource
    url = solar_resource_address
    response = make_call(url)
    response['outputs']
    # 'avg_dni' 'avg_ghi' 'avg_lat_tilt' -- each one has 'annual' and 'monthly'
    # http://developer.nrel.gov/docs/solar/solar-resource-v1/
  end

  def get_data
    url = solar_data_address
    response = make_call(url)
    if response['errors'].any?
      {:error => response['errors'], :output => response['outputs']}
    else
      outputs = response['outputs']
      outputs.first.last
    end
  end

end
