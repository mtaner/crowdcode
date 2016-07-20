class Feature < ApplicationRecord
	belongs_to :project
	has_many :requests

  def get_assigned_dev
    request = self.requests.select {|request| request.assigned == true}.first
    request ? request.user.email : 'Not Assigned'
  end
end
