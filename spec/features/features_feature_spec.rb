require 'rails_helper'

feature 'adding features to project' do

  let!(:user) do
    User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  let!(:developer) do
    User.create(email: 'dev@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  let!(:project) do
    Project.create(name: 'Test Project', user_id: user.id)
  end

  let!(:feature) do
		Feature.create(name: 'Test Feature', description: 'Test Feature',
                  deadline: '08/09/16', project_id: project.id)
	end

  context '1 project has been added with no features added' do

    scenario 'project has no features' do
      visit project_path(project)
      expect(page).to have_content('No features yet')
      expect(page).to have_link('Add Feature')
    end
  end

  context '1 project has been added with features' do

    before :each do
      visit project_path(project)
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
      expect(current_path).to eq project_path(project)
    end

    scenario 'adds features link takes user to correct path' do
      visit project_path(project)
      click_link('Add Feature')
      expect(current_path).to eq new_project_feature_path(project)
    end

    let!(:request) do
      Request.create(feature_id: feature.id, assigned: false, user_id: developer.id)
    end

    scenario 'user clicks feature name and visits feature page' do
      visit project_path(project)
      click_on('Test Feature')
      expect(page).to have_content('Test Feature')
      expect(current_path).to eq feature_path(feature)
      expect(page).to have_content('Assigned Developer: Not Assigned')
    end


  end

  context 'developer has been assigned to feature' do

    let!(:request) do
      Request.create(feature_id: feature.id, assigned: true, user_id: developer.id)
    end

    scenario 'user can see the assigned developer' do
      visit project_path(project)
      click_on('Test Feature')
      expect(page).to have_content('Assigned Developer: dev@test.com')
    end

  end

end
