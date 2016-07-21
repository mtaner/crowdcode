class Project < ApplicationRecord

	extend WithUserAssociationExtension

	belongs_to :user
	has_many :features, dependent: :destroy

  def progress
    assigned_features = []
    self.features.each do |feature|
      assigned_features += feature.requests.select {|request| request.assigned == true}
    end

    p assigned_features.length / self.features.length.to_f
  end

end
