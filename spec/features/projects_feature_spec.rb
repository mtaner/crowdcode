require 'rails_helper'

feature 'Projects' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  context 'adding a project' do
    scenario 'should display a link to add a project' do
      visit '/projects'
      expect(page).to have_link 'New Project'
      click_link 'New Project'
      expect(current_path).to eq '/projects/new'
    end
  end

  context 'creating a project' do
    scenario 'prompt user to fill out a form, then displays the new project' do
      visit '/projects/new'
      fill_in 'Name', with: 'Songodoro'
      fill_in 'Description', with: 'Music break'
      fill_in 'Launch date', with: '01/12/2016'
      click_button 'Create Project'
      expect(page).to have_content 'Songodoro'
    end
  end
end
