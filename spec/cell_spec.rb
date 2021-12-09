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

  describe '#render' do
    it "prints '.'" do
      cell_1 = Cell.new("B4")
#prints . by default
      expect(cell_1.render).to eq(".")
    end

    it "prints 'M'" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.fire_upon
#prints M if fired_upon == true and empty? == true
      expect(cell_1.render).to eq("M")
    end

    it "prints '.'" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_2 = Cell.new("C3")
#prints . if empty? == false and render has no argument
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
    end

    it "prints 'S'" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_2 = Cell.new("C3")
#prints S if empty == false and render has an argument of true
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end

    it "prints 'H'" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_2 = Cell.new("C3")
#prints H if empty? returns false and fired_upon? returns true
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      cruiser.hit
    end

    it "prints 'X'" do
      cell_1 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_2 = Cell.new("C3")
#combination of all tests. New test is prints X if sunk?==true
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      cruiser.hit
      cruiser.hit
      expect(cell_2.render).to eq("X")
    end
  end
end
