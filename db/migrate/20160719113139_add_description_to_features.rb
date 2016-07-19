class AddDescriptionToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :description, :text
  end
end
