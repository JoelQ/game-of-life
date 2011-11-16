class Cell
  attr_accessor :x, :y, :live, :world, :next_gen
  
  def initialize(world, x=0, y=0)
    @x = x
    @y = y
    @next_gen = false
    @neighbors = []
    @live = false
    @world = world
  end
 
  def neighbors
    count = 0
    
    # Force the neighbor check to wrap around instead of checking for non existing cells (overflow)
    # Note: the coordinate system starts at 0 but the width/height of the world starts at 1
    #       so a cell at @world.width, @world.height does not exist
    @x+1 == @world.width ? x_plus_1 = 0 : x_plus_1 = @x+1
    @y+1 == @world.height ? y_plus_1 = 0 : y_plus_1 = @y+1
     
    count += 1 if @world.cells[@x-1][y_plus_1].live?
    count += 1 if @world.cells[@x-1][@y].live?
    count += 1 if @world.cells[@x-1][@y-1].live?
    count += 1 if @world.cells[@x][y_plus_1].live?
    count += 1 if @world.cells[@x][@y-1].live?
    count += 1 if @world.cells[x_plus_1][y_plus_1].live?
    count += 1 if @world.cells[x_plus_1][@y].live?
    count += 1 if @world.cells[x_plus_1][@y-1].live?
    
    count
  end
  
  def live?
    @live
  end
  
  def live!
    @live = true
  end
  
  def dead!
    @live = false
  end
  
  def ng_live!
    @next_gen = true
  end
  
  def ng_dead!
    @next_gen = false
  end
end