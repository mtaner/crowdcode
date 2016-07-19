class AddNameToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :name, :string
  end
end
