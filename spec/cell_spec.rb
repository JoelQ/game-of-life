require 'spec_helper'

describe "Cell" do
  
  before(:each) do
    @world = World.new(3,3)
    @cell = @world.cells[1][1]
  end
  
  describe "properties" do
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
  end


  describe "neighbors" do
    it "should get its live neighbors" do
      neighbor_cell = @world.cells[0][1]
      @cell.live!
      neighbor_cell.live!
      @cell.neighbors.should == 1
    end
    
    it "should get live neighbors with negative coordinates (negative wraparound)" do
      # wrap around from the left or top
      corner_cell = @world.cells[0][0]
      corner_cell.live!
      @world.cells[2][2].live!
      @world.cells[2][0].live!
      @world.cells[0][2].live!
      corner_cell.neighbors.should == 3 
    end
    
    it "should get live neighbors with coordinates greater than world size (positive wraparound)" do
      # wrap around from the right or bottom
      corner_cell = @world.cells[2][2]
      corner_cell.live!
      @world.cells[0][0].live!
      @world.cells[2][0].live!
      @world.cells[0][2].live!
      corner_cell.neighbors.should == 3 
    end
  end  

  
  describe "life/death methods" do
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
  

end