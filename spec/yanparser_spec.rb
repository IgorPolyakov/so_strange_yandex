require 'rspec'
require 'yanparser'
RSpec.describe YanParser do
  it 'Show main page' do
    qua = YanParser.new
    expect(qua.title).to eq "Яндекс"
  end
end