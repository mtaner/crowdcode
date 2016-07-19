class Feature < ApplicationRecord
	belongs_to :project
	has_many :requests
end
