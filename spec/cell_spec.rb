require 'spec_helper'

describe "Cell" do
  
  before(:each) do
    @world = World.new(3,3)
    @cell = @world.cells[1][1]
  end
  
  
  it "should have an x coordinate" do
    @cell.x.should == 1
  end
  
  it "should have a y coordinate" do
    @cell.y.should == 1
  end
  
  it "should have a world" do
    @cell.world.should == @world
  end
  
  it "should find itself via its coordinates" do
    @world.cells[@cell.x][@cell.y].should == @cell
  end
  
  it "should spawn a cell" do
    cell2 = @cell.spawn_relative(1, 1)
    cell2.x.should == 6
    cell2.y.should == 5
  end
  
  it "should get its live neighbors" do
    world = World.new(2,2)
    cell = world.cells[1][1]
    neighbor_cell = world.cells[0][1]
    cell.live!
    neighbor_cell.live!
    cell.neighbors.should == [neighbor_cell]
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
  
  it "should have a live? method" do
    cell2 = Cell.new(3, 3)
    cell2.live = true
    cell2.live?.should === true
    @cell.live?.should === false
  end
  
  it "should have a live! method" do
    @cell.live!
    @cell.live?.should === true
  end
  
  it "should have a dead! method" do
    @cell.dead!
    @cell.live?.should === false
  end
end