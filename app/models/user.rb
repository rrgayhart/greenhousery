 class User < ActiveRecord::Base
  authenticates_with_sorcery!
  geocoded_by :address
  after_validation :geocode
  has_many :projects

  def address
    [street, city, state, country].compact.join(', ')
  end

end
