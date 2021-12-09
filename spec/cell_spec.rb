require './lib/ship'
require './lib/cell'
Rspec.describe "cell" do
  #Tests to see if the cell instance exists
  it "initalizes" do
    cell = Cell.new("B4")
    #Does cell exist?
    expect(cell).to be_a (Cell)
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
end

  it "is empty?" do
    cell = Cell.new("B4")
    expect(cell.empty?).to (true)
  end

  it "places ship" do
    cell = Cell.new("B4")
    cell.place_ship(cruiser)
    #checks to see if the ship was placed, nothing is returned
    expect(cell.ship).to eq(Ship)
  end

  it "fired upon?" do
    cell = Cell.new("B4")
    #returns a boolean depending on if the cell is equal to: X, H, M, etc
    expect(cell.fired_upon?).to eq(false)
  end

  it "fire upon" do
    cell = Cell.new("B4")
    cell.fire_upon
    expects(cell.fire_upon?).to eq(true)
    expects(cell.ship)
  end



end
