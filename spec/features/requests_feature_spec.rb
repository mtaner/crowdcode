require 'rails_helper'

feature 'sending in request to work on a feature' do

	let!(:project) do
		Project.create
	end

	let!(:feature) do
		Feature.create(name: 'Feature name', description: 'Feature description', deadline: '08/09/16', project_id: project.id)
	end

	# let(:request) do
	# 	Request.create(feature_id: feature.id, assigned: false)
	# end
	#
	context 'one project has been added with one feature' do


		scenario 'feature is initially not assigned' do
			visit project_path(project)
			expect(page).to have_content('Not assigned')
			expect(page).to have_link('Send Request')
		end
	end
end
