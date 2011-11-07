class Cell
  attr_accessor :x, :y, :world, :neighbors
  
  def initialize(x=0,y=0, world)
    @x = x
    @y = y
    @world = world
    @world.cells.push self
    @neighbors = []
  end
  
  def spawn_relative(x, y)
    new_x = @x + x
    new_y = @y + y
    new_cell = Cell.new(new_x, new_y, self.world)
    set_neighbor(new_cell) if (x.abs == 1) || (y.abs == 1)
    
    return new_cell
  end
  
  def set_neighbor(cell)
    neighbors.push cell
    cell.neighbors.push self
  end
end