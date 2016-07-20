def signup
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def login(email: 'test@example.com', password: 'testtest')
	visit('/')
  click_on('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_on('Sign in')
end
