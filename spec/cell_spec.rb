require 'pry'
require './lib/ship'
require './lib/cell'
RSpec.describe "cell" do
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
    expect(cell.empty?).to eq(true)
  end

  it "places ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    #checks to see if the ship was placed, nothing is returned
    expect(cell.ship).to be_a(Ship)
  end

  it "fired upon?" do
    cell = Cell.new("B4")
    #returns a boolean depending on if the cell is equal to: X, H, M, etc
    expect(cell.fired_upon?).to eq(false)
  end

  it "fire upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon


    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end



end
