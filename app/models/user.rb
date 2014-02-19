class User < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, state, country].compact.join(', ')
  end

end
