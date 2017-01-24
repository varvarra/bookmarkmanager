require 'link'

describe Link do

  # it 'Displaying a list of links' do
  #   allow(link).to receive(:view) { :value }
  #   expect(link.view).to eq (:value)
  # end

  scenario 'shows links' do
    Link.create(url: 'http://www.google.com', title: 'Google')

    # visit '/links'
  end
end
