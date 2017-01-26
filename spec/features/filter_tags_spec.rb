feature 'Filter tags' do

  scenario 'to find links on cetain topic' do
    register
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])

    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
      expect(page).not_to have_content('Makers Academy')
    end
  end

end
