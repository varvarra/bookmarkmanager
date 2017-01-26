feature 'Adding multiple tags' do
  scenario 'want to have multiple tags for a link' do

    visit '/links/new'
    fill_in 'url', with: 'http://www.twitter.com/'
    fill_in 'title', with: "Twitter"
    fill_in 'tags', with: 'social news'

    click_button("Save Link")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social', 'news')

  end

end
