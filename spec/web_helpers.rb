def sign_up(email: 'test@example.com  ', password: 'testtest', password_confirmation: 'testtest' )
  visit root_path
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password_confirmation)
  click_button('Sign up')
end

def login(email: 'test@example.com', password: 'testtest')
	visit root_path
  click_on('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_on('Sign in')
end


def create_project(name: 'Songodoro', description: 'Music break', launch_date: '01/12/2016')
  visit new_project_path
  fill_in('Name', with: name)
  fill_in('Description', with: description)
  fill_in('Launch date', with: launch_date)
  click_button('Create Project')
  expect(page).to have_content('Songodoro')
end

def edit_profile(name: 'Bob', description: 'Ruby developer')
  click_link('My profile')
  click_link('Edit profile')
  fill_in('Name', with: name)
  fill_in('Description', with: description)
  attach_file('Image', 'spec/files/images/bob.jpg')
  click_button('Update User')
end
