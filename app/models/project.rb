class Project < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  has_many :project_arrays

  def address
    [street, city, state, country].compact.join(', ')
  end

  def get_station_data
    nrel = NrelCall.new({:lat => self.latitude, :lon => self.longitude})
    data = nrel.get_data
    unless data[:error]
      formatted_data = format_station_data(data)
      self.update_attributes(formatted_data)
    end
  end

  def format_station_data(data)
    formatted_data = {}
    formatted_data[:station_city] = data["city"]
    formatted_data[:station_state] = data["state"]
    formatted_data[:distance_from_station] = data["distance"]
    formatted_data[:station_elevation] = data["elevation"]
    formatted_data[:station_timezone] = data["timezone"]
    formatted_data
  end

end
