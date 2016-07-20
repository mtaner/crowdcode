class AddAssignedToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :assigned, :boolean
  end
end
