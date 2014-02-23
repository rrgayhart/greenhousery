 class User < ActiveRecord::Base
  authenticates_with_sorcery!
  geocoded_by :address
  after_validation :geocode
  has_many :projects
  validates :password, presence: true, confirmation: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true


  def address
    [street, city, state, country].compact.join(', ')
  end

end
