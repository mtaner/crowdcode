class AddProjectRefToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_reference :features, :project, foreign_key: true
  end
end
