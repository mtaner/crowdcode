class AddDeadlineToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :deadline, :date
  end
end
