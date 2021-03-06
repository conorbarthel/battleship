require './lib/ship'
RSpec.describe 'ship' do
  it 'initializes' do
    cruiser = Ship.new("Cruiser", 3)
    #cruiser is a Ship
    expect(cruiser).to be_a Ship
    #attr_reader is added
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.health).to eq(3)

    expect(cruiser.health).to eq(cruiser.length)
    expect(cruiser.health).to eq(3)
  end

  describe '#sunk?' do
    it 'returns boolean for ship sunk' do
      cruiser = Ship.new("Cruiser", 0)
#should check that health is > 0
      expect(cruiser.sunk?).to eq(true)
    end
  end

  describe '#hit' do
    it 'removes 1 health from ship' do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
  #removes one from health counter
      expect(cruiser.health).to eq(2)
      cruiser.hit
      expect(cruiser.health).to eq(1)
      cruiser.hit
  #Three hits should sink ship
      expect(cruiser.sunk?).to eq(true)
    end
  end

end
