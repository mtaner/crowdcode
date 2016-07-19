class AddFeatureRefToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :feature, foreign_key: true
  end
end
