require 'rails_helper'

feature 'adding features to project' do

	let!(:user) do
    User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  let!(:project) do
    Project.create(name: 'Test Project', user_id: user.id)
  end

	context '1 project has been added with no features added' do

		scenario 'project has no features' do
			visit(project_path(project))
			expect(page).to have_content('No features yet')
			expect(page).to have_link('Add Feature')
		end

		scenario 'adds features link takes user to correct path' do
			visit(project_path(project))
			click_link('Add Feature')
			expect(current_path).to eq(new_project_feature_path(project))
		end

	end

	context '1 project has been added with features' do

		before :each do
			visit(project_path(project))
			click_on('Add Feature')
		end

		scenario 'adds features to the project' do
			fill_in 'feature_name', with: 'Test Feature Name 1'
			fill_in 'feature_description', with: 'Test Description 1'
			fill_in 'feature_deadline', with: '31/08/16'
			click_on('Create Feature')
			expect(page).to have_content('Name 1')
			expect(page).to have_content('Description 1')
			expect(page).to have_content('31/08/16')
			expect(current_path).to eq(project_path(project))
		end

    let!(:feature) do
  		Feature.create(name: 'Test Feature', description: 'Test Feature',
                    deadline: '08/09/16', project_id: project.id)
  	end

    # scenario 'user clicks feature name and visits feature page' do
    #   visit "/projects/#{project.id}"
    #   click_on 'Test Feature'
    #   expect(page).to have_content 'Test Feature'
    #   expect(current_path).to eq "/features/#{Feature.last.id}"
    #   expect(page).to have_content 'Assigned Developer: Not Assigned'
    # end


	end

  context 'developer has been assigned to feature' do

    before :each do
			visit(project_path(project))
			click_on('Add Feature')
		end

    let!(:feature) do
  		Feature.create(name: 'Test Feature', description: 'Test Feature',
                    deadline: '08/09/16', project_id: project.id)
  	end

    let(:request) do
  		Request.create(feature_id: feature.id, assigned: true)
    end

    scenario 'user can see the assigned developer' do
      visit "/projects/#{project.id}"
      click_on 'Test Feature'
      expect(page).to have_content 'Assigned Developer: Bob@email.com'
    end

  end

end
