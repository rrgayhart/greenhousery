class Project < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  has_many :project_arrays

  def address
    [street, city, state, country].compact.join(', ')
  end

end
