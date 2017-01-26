

feature 'Creating links' do
  scenario 'want to save a web page' do
    register
    visit '/links/new'
    expect(page).to have_button("Save Link")
  end

  scenario 'to create a new link' do
    register
    visit '/links/new'
    fill_in 'url', with: 'http://www.twitter.com/'
    fill_in 'title', with: "I love twitter!"
    click_button("Save Link")
    expect(current_path).to eq '/links'
    # do we need a within here?
    expect(page).to have_content("I love twitter!")
  end

end
