class Project < ApplicationRecord

	extend WithUserAssociationExtension

	belongs_to :user
	has_many :features, dependent: :destroy

	has_attached_file :image, :styles => { :large => "700x700>", :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def progress
		assigned_features = []
		self.features.each do |feature|
			assigned_features += feature.requests.select {|request| request.assigned}
		end

		if (self.features.length) != 0
			p ((assigned_features.length / self.features.length.to_f)*100).to_i.to_s + '%'
		else
		end
	end
end
