class Project < ApplicationRecord

	extend WithUserAssociationExtension

	belongs_to :user
	has_many :features, dependent: :destroy

	has_attached_file :image, :styles => { :large => "700x700>", :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
