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
end
