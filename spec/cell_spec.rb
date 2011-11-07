require 'spec_helper'

describe "Cell" do
  
  before(:each) do
    @world = World.new
    @cell = Cell.new(5,4, @world)
  end
  
  
  it "should have an x coordinate" do
    @cell.x.should == 5
  end
  
  it "should have a y coordinate" do
    @cell.y.should == 4
  end
  
  it "should belong to a world" do
    @cell.world.should == @world
  end
  
  it "should spawn a cell" do
    cell2 = @cell.spawn_relative(1, 1)
    cell2.x.should == 6
    cell2.y.should == 5
  end
  
  it "should set the cell as a neighbor if it is within distance 1" do
    cell2 = @cell.spawn_relative(1, 1)
    @cell.neighbors.should include(cell2)
    cell2.neighbors.should include(@cell)
  end
  
  it "should not set the cell as a neighbor if distance is greater than 1" do
    cell2 = @cell.spawn_relative(2, 2)
    @cell.neighbors.should_not include(cell2)
    cell2.neighbors.should_not include(@cell)
  end
end