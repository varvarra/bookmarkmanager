feature 'Adding tags' do
  scenario 'want to add tags to links' do
    visit '/creating_links'

    expect(page).to have_button("Add tag")
  end

  scenario 'to create a new link' do
    visit '/creating_links'
    fill_in 'url', with: 'http://www.twitter.com/'
    fill_in 'title', with: "Twitter"
    fill_in 'tags', with: 'social'

    click_button("Save Link")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')

    # do we need a within here?
    expect(page).to have_content("I love twitter!")
  end

end
