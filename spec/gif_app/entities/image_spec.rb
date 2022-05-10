RSpec.describe Image, type: :entity do
  it 'can be initialized with attributes' do
    image = Image.new(giphy_id: 'dsfs324rew', url: 'https://giphy.com/gifs/school-college-test-12vJgj7zMN3jPy')
    expect(image.url).to eq('https://giphy.com/gifs/school-college-test-12vJgj7zMN3jPy')
    expect(image.giphy_id).to eq('dsfs324rew')
  end
end
