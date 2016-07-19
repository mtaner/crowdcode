class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|

      t.timestamps
    end
  end
end
