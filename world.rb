class World
  
  attr_accessor :cells
  
  def initialize
    @cells = []
  end
  
  def tick!
    tmp_cells = []
    self.cells.each do |cell|
      
      if cell.neighbors.count < 2 # Rule 1
        cell = nil
      elsif (cell.neighbors.count == 2) || (cell.neighbors.count == 3) # Rule 2 
        tmp_cells.push cell
      elsif cell.neighbors.count > 3 # Rule 3
        cell = nil
      end
    end
    
    self.cells = tmp_cells
  end
end