require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

  feature 'Users can see and edit their profiles' do
    let!(:user) do
      User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest')
    end

    context 'View own profile' do
      it 'should go to own profile' do
        signup
        click_link 'My profile'
        expect(page).to have_content 'test@example.com'
      end
    end


    context 'Editing profiles' do


      it 'should be able to edit own profile' do
        signup
        click_link 'My profile'
        click_link 'Edit profile'
        fill_in 'Name', with: 'Bob'
        fill_in 'Description', with: 'Ruby developer'
        click_button 'Update User'
        expect(page).to have_content 'Bob'
        expect(page).to have_content 'Ruby developer'
      end

      it 'should not be able to edit other profiles' do
        signup
        click_link 'My profile'
        visit user_path(user)
        expect(page).to_not have_content 'Edit profile'
      end
  end
end
