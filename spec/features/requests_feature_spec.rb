require 'rails_helper'

feature 'sending in request to work on a feature' do

	let!(:entrepreneur) do
    User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

	let!(:developer) do
    User.create(email: 'dev@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

	let!(:project) do
		Project.create(name: 'Test Project', user: entrepreneur)
	end

	let!(:feature) do
		Feature.create(name: 'Feature name', description: 'Feature description', deadline: '08/09/16', project: project)
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

		scenario 'developer can send a request to work on a feature', js:true do
			visit project_path(project)
			click_on('Send Request')
			expect(current_path).to eq project_path(project)
			expect(page).to have_content('Your request has been sent')
		end
	end
end
