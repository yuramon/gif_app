RSpec.describe Gif, type: :entity do
  it 'can be initialized with attributes' do
    gif = Gif.new(giphy_id: 'dsfs324rew', url: 'https://giphy.com/gifs/school-college-test-12vJgj7zMN3jPy')
    expect(gif.url).to eq('https://giphy.com/gifs/school-college-test-12vJgj7zMN3jPy')
    expect(gif.giphy_id).to eq('dsfs324rew')
  end
end
