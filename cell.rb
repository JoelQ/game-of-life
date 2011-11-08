class Cell
  attr_accessor :x, :y, :live, :neighbors, :world
  
  def initialize(world, x=0, y=0)
    @x = x
    @y = y
    @neighbors = []
    @live = false
    @world = world
  end
  
  def spawn_relative(x, y)
    new_x = @x + x
    new_y = @y + y
    new_cell = Cell.new(new_x, new_y)
    set_neighbor(new_cell) if (x.abs == 1) || (y.abs == 1)
    
    return new_cell
  end
  
  def set_neighbor(cell)
    neighbors.push cell
    cell.neighbors.push self
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
end