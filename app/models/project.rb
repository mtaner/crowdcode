class Project < ApplicationRecord

	extend WithUserAssociationExtension

	belongs_to :user
	has_many :features, dependent: :destroy
end
