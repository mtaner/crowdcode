require 'rails_helper'

feature 'adding features to project' do
	context '1 project has been added with no features added' do

			let!(:project) do
				Project.create
			end

		scenario 'project has no features' do
			visit("/projects/#{project.id}")
			expect(page).to have_content('No features yet')
			expect(page).to have_link('Add Feature')
		end
	end
end
