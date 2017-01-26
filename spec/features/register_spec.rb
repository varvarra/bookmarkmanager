feature 'Adding User Account' do
  scenario 'Register User while on the landing page' do
    register

    expect(current_path).to eq '/links'
    expect { register}.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, name@gmail.com!'
    expect(User.first.email).to eq('name@gmail.com')
  end
end
