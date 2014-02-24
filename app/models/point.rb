class Point < ActiveRecord::Base
  belongs_to :project_array
  validates :project_array_id, presence: true
end
