class Request < ApplicationRecord

	extend WithUserAssociationExtension

	belongs_to :feature
	belongs_to :user


end
