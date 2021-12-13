require './lib/game'

RSpec.describe 'game' do
  before(:each) do
    @game = Game.new
  end

  xit 'exists' do
    expect(@game).to be_a(Game)
  end


end
