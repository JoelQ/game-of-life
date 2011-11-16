require 'spec_helper'

describe "game of life rules" do
  before(:each) do
    @world = World.new(3,3)
    @cell = @world.cells[1][1]
    @cell.live!
  end
  
  describe "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    it "should follow rule 1 with no neighbors" do
      @world.tick!
      @cell.live?.should == false
    end
    
    it "should follow rule 1 with one neighbor" do
      @world.cells[0][0].live!
      @world.tick!
      @cell.live?.should == false
    end
  end
  
  
  describe "Rule 2: Any live cell with two or three live neighbours lives on to the next generation." do
    it "should follow rule 2 with two neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.tick!
      @cell.live?.should == true
    end
    
    it "should follow rule 2 with three neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.tick!
      @cell.live?.should == true
    end
  end
  
  
  describe "Rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding." do
    it "should follow rule 3 with 4 neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.cells[1][0].live!
      @world.tick!
      @cell.live?.should == false
    end
    
    it "should follow rule 3 with 5 neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.cells[1][0].live!
      @world.cells[1][2].live!
      @world.tick!
      @cell.live?.should == false
    end
    
    it "should follow rule 3 with 6 neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.cells[1][0].live!
      @world.cells[1][2].live!
      @world.cells[1][2].live!
      @world.cells[2][0].live!
      @world.tick!
      @cell.live?.should == false
    end
    
    it "should follow rule 3 with 7 neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.cells[1][0].live!
      @world.cells[1][2].live!
      @world.cells[1][2].live!
      @world.cells[2][0].live!
      @world.cells[2][1].live!
      @world.tick!
      @cell.live?.should == false
    end
    
    it "should follow rule 3 with 8 neighbor cells" do
      @world.cells[0][0].live!
      @world.cells[0][1].live!
      @world.cells[0][2].live!
      @world.cells[1][0].live!
      @world.cells[1][2].live!
      @world.cells[1][2].live!
      @world.cells[2][0].live!
      @world.cells[2][1].live!
      @world.cells[2][2].live!
      @world.tick!
      @cell.live?.should == false
    end
  end
  
  describe "Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
    it "should generate a live cell if it has 3 live neighbors" do
      @cell.dead!
      @world.cells[0][0].live!
      @world.cells[0][2].live!
      @world.cells[2][1].live!
      @world.tick!
      @cell.live?.should == true
    end

    
  end
  
end