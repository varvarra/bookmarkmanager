
feature 'Creating links' do
  scenario 'want to save a web page' do
    visit '/links/new'
    expect(page).to have_button("Save Link")
  end
end
