class User < ActiveRecord::Base
  geocoded_by :address

  def address
    [street, city, state, country].compact.join(', ')
  end

end
