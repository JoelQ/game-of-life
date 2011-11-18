class World
  # Cells in the world are stored in quadrant 4 coordinate system
  # 0,0  1,0  2,0
  # 0,1  1,1  2,1
  # 0,2, 1,2  2,2
  
  attr_accessor :cells, :width, :height
  
  def initialize(width=20, height=20)
    @width = width
    @height = height
    
    # Create a nil 2d array (len x wid)
    @cells = Array.new(width) {Array.new(height)}
    
    # Fill the array with cells
    x = 0
    @cells.each do |col|
      col.fill {|y| Cell.new(self, x, y)}
      x += 1
    end
  end
  
  def tick!
    
    # Determine the fate of each cell and store it in the next_gen attribute
    self.cells.each do |col|
      col.each do |cell|
        
        if cell.live?
          if cell.neighbors < 2 # Rule 1
            cell.ng_dead!
          elsif (cell.neighbors == 2) || (cell.neighbors == 3) # Rule 2 
            cell.ng_live!
          elsif cell.neighbors > 3 # Rule 3
            cell.ng_dead!
          end
        else #cell is dead
          if cell.neighbors == 3 # Rule 4
            cell.ng_live!
          end
        end
         
      end
    end
    
    # Update all cells to the new state using value stored in next_gen
    self.cells.each do |col|
      col.each do |cell|
        cell.live = cell.next_gen
      end
    end
    
  end
  
  
  def load_pattern(pattern)
    # takes a 2d-array as input
    #assumes the pattern is valid and fits the dimensions of the world
    self.cells.each do |col|
      col.each do |cell|
        cell.live = pattern[cell.x][cell.y]
      end
    end
  end
  
end