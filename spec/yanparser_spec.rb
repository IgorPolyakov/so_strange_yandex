require 'rspec'
require 'yanparser'
RSpec.describe YanParser do
  it 'Parse main page' do
    qua = YanParser.new
    expect(qua.title).to eq "Яндекс"
  end
  it 'Render yandex page' do

  end
end