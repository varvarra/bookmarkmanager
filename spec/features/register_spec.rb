feature 'Adding User Account' do
  scenario 'Register Uer while on the landing page' do
    register

    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, name@gmail.com!'
    expect($user_count).to eq(1)
  end
end
