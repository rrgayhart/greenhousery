class ProjectArray < ActiveRecord::Base
  belongs_to :project
  has_many :points
  validates :project_id, presence: true
  after_validation :set_name
  

  def set_name
    unless self.name
      self.name = "#{self.project.name} Array"
      self.save
    end
  end
end
