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
    #checks to see if the ship was placed, nothing is returned
    expect(cell.ship(cruiser)).to eq(Ship)
  end

  # it "fired upon?" do
  #   cell = Cell.new("B4")
  #   #returns a boolean depending on if the cell is equal to: X, H, M, etc
  #   expect(cell.fired_upon?).to eq(false)
  #   #nothing is returned but changes the cell to X
  #   expect(cell.fire_upon).to (x) #I'm not very comfident if this is what we should test
  #   #there's no need to test cell.ship.health because it was already tested in the ship_spec file
  end



end
