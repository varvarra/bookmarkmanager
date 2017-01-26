def register
  visit('/')
  fill_in 'email', with: 'name@gmail.com'
  fill_in 'password', with: 'qwerty'
  click_button 'Submit'
end
