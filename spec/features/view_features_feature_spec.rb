# require 'rails_helper'
#
# feature 'viewing features' do
#
# 	let!(:entrepreneur) do
#     User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest')
#   end
#
# 	let!(:developer) do
#     User.create(email: 'dev@test.com', password: 'testtest', password_confirmation: 'testtest')
#   end
#
# 	let!(:project) do
# 		Project.create(name: 'Test Project', user: entrepreneur)
# 	end
#
# 	let!(:feature) do
# 		Feature.create(name: 'Feature name', description: 'Feature description', deadline: '08/09/16', project: project)
# 	end
#
# 	let!(:request) do
# 		Request.create(feature: feature, user: developer, assigned: false)
# 	end
#
# 	context '1 project with 1 feature that has 1 request' do
# 		before :each do
# 			login(email: 'owner@test.com')
# 			visit feature_path(feature)
# 		end
#
# 		scenario 'entrepreneur can view the request for the feature' do
# 			expect(page).to have_content('dev@test.com')
# 			expect(page).to have_link('Select')
# 		end
#
# 		scenario 'entrepreneur can select a developer' do
# 			click_on('Select')
# 			expect(current_path).to eq feature_path(feature)
# 			expect(page).to have_content('Assigned Developer: dev@test.com')
# 			expect(page).not_to have_link('Select')
# 		end
# 	end
#
# end
