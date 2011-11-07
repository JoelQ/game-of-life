require 'spec_helper'

describe "game of life rules" do
  before(:each) do
    @world = World.new
  end
  
  describe "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    it "should follow rule 1 with no neighbors" do
      cell = Cell.new(3, 3, @world)
      @world.tick!
      @world.cells.should_not include(cell)
    end
    
    it "should follow rule 1 with one neighbor" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1,0)
      @world.tick!
      @world.cells.should_not include(cell)
    end
  end
  
  
  describe "Rule 2: Any live cell with two or three live neighbours lives on to the next generation." do
    it "should follow rule 2 with two neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      @world.tick!
      @world.cells.should include(cell)
    end
    
    it "should follow rule 2 with three neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      @world.tick!
      @world.cells.should include(cell)
    end
  end
  
  
  describe "Rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding." do
    it "should follow rule 3 with 4 neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      cell.spawn_relative(0, -1)
      @world.tick!
      @world.cells.should_not include(cell)
    end
    
    it "should follow rule 3 with 5 neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      cell.spawn_relative(0, -1)
      cell.spawn_relative(1, 1)
      @world.tick!
      @world.cells.should_not include(cell)
    end
    
    it "should follow rule 3 with 6 neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      cell.spawn_relative(0, -1)
      cell.spawn_relative(1, 1)
      cell.spawn_relative(-1, -1)
      @world.tick!
      @world.cells.should_not include(cell)
    end
    
    it "should follow rule 3 with 7 neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      cell.spawn_relative(0, -1)
      cell.spawn_relative(1, 1)
      cell.spawn_relative(-1, -1)
      cell.spawn_relative(-1, 1)
      @world.tick!
      @world.cells.should_not include(cell)
    end
    
    it "should follow rule 3 with 8 neighbor cells" do
      cell = Cell.new(3, 3, @world)
      cell.spawn_relative(1, 0)
      cell.spawn_relative(-1, 0)
      cell.spawn_relative(0, 1)
      cell.spawn_relative(0, -1)
      cell.spawn_relative(1, 1)
      cell.spawn_relative(-1, -1)
      cell.spawn_relative(-1, 1)
      cell.spawn_relative(1, -1)
      @world.tick!
      @world.cells.should_not include(cell)
    end
  end
  
  describe "Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
    
  end
  
end