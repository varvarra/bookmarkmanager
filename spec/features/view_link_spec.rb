

feature 'Viewing links' do

  # it 'Displaying a list of links' do
  #   allow(link).to receive(:view) { :value }
  #   expect(link.view).to eq (:value)
  # end

  scenario 'shows links' do
    Link.create(url: 'http://www.google.com', title: 'Google')

    visit '/link'
    expect(page.status_code).to eq 200

    within 'link' do
      expect(page).to have_content('Google')
    end
 end
end
