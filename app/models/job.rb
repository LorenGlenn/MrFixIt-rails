class Job < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :worker
  belongs_to :user
end
