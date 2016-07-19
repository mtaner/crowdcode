require 'rails_helper'

feature 'Projects' do
  # context 'adding a project' do
  #   scenario 'should display a link to add a project' do
  #     visit '/projects'
  #     expect(page).to have_link 'New project'
  #     click_link 'New project'
  #     expect(current_path).to eq '/projects/new'
  #   end
  # end

  context 'creating a project' do
    scenario 'prompt user to fill out a form, then displays the new project' do
      visit '/projects/new'
      #click_link 'New project'
      fill_in 'Name', with: 'Songodoro'
      fill_in 'Language', with: 'Ruby'
      fill_in 'Description', with: 'Music break'
      fill_in 'Launch date', with: '01/12/2016'
      click_button 'Add Project'
      expect(current_path).to eq "/projects/#{songodoro.id}"
    end
  end
end
