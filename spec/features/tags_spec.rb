feature 'Adding tags' do

  scenario 'to add tag to a link' do

    register

    visit '/links/new'
    fill_in 'url', with: 'http://www.twitter.com/'
    fill_in 'title', with: "Twitter"
    fill_in 'tags', with: 'social'

    click_button("Save Link")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')


  end

end
