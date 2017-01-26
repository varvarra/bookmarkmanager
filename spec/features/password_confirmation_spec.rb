feature 'Mismatching passwords' do
  scenario 'Checks that no new users are created' do

  expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)

  end

  def sign_up(email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

end
