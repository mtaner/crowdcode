require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit root_path
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit root_path
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit root_path
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit root_path
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit root_path
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
        sign_up
        click_link('My profile')
        expect(page).to have_content('test@example.com')
      end

      it 'should show the projects the user started' do
        sign_up
        create_project
        click_link('My profile')
        expect(page).to have_content('test@example.com')
        expect(page).to have_content('Songodoro')
      end

      it 'should take you to project when clicked' do
        sign_up
        create_project
        click_link('My profile')
        click_link('Songodoro')
        expect(page).to have_content('Songodoro')
        expect(page).to have_content('Add Feature')
      end

    end


    context 'Editing profiles' do


      it 'should be able to edit own profile' do
        sign_up
        edit_profile
        expect(page).to have_content('Bob')
        expect(page).to have_content('Ruby developer')
      end

      it 'should not be able to edit other profiles' do
        sign_up
        click_link('My profile')
        visit user_path(user)
        expect(page).to_not have_content('Edit profile')
      end

      it 'should be able to upload an image' do
        sign_up
        edit_profile
        expect(page).to have_css("img[src*='bob.jpg']")
      end
  end
end
