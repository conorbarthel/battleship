require './lib/ship'
RSpec.describe 'ship' do
  it 'initializes' do
    cruiser = Ship.new("Cruiser", 3)
    #cruiser is a Ship
    expect(cruiser).to be_a Ship
    #attr_reader is added
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
  #I think we want to initialize health and add to attr_reader
    expect(cruiser.health).to eq(cruiser.length)
  end

  describe '#sunk?' do
    it 'returns boolean for ship sunk' do
      cruiser = Ship.new("Cruiser", 3)
#should check that health is > 0
      expect(cruiser.sunk?).to eq(false)
    end
  end

  describe '#hit' do
    it 'removes 1 health from ship' do
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      
      expect()
    end
  end

end
