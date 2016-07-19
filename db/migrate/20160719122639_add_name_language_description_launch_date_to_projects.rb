class AddNameLanguageDescriptionLaunchDateToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :name, :string
    add_column :projects, :language, :string
    add_column :projects, :description, :text
    add_column :projects, :launch_date, :datetime
  end
end
