class World
  # Cells in the world are stored in quadrant 4 coordinate system
  # 0,0  1,0  2,0
  # 0,1  1,1  2,1
  # 0,2, 1,2  2,2
  
  attr_accessor :cells, :live_cells, :width, :height
  
  def initialize(width=20, height=20)
    @width = width
    @height = height
    
    # Create a nil 2d array (len x wid)
    @cells = Array.new(width) {Array.new(height)}
    @live_cells = []
    
    # Fill the array with cells
    x = 0
    @cells.each do |col|
      col.fill {|y| Cell.new(self, x, y)}
      x += 1
    end
  end
  
  def tick!
    tmp_cells = self.cells
    @live_cells = []
    
    self.cells.each do |col|
      col.each do |cell|
        
        if cell.live?
          if cell.neighbors < 2 # Rule 1
            tmp_cells[cell.x][cell.y].dead!
          elsif (cell.neighbors == 2) || (cell.neighbors == 3) # Rule 2 
            live_cells.push cell
            tmp_cells[cell.x][cell.y].live!
          elsif cell.neighbors > 3 # Rule 3
            tmp_cells[cell.x][cell.y].dead!
          end
        end
        
      end
    end
    
    self.cells = tmp_cells
  end

  
end