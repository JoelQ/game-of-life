class World
  
  attr_accessor :cells
  
  def initialize(len=20, wid=20)
    @cells = Array.new(len, Array.new(wid))
    
    #@cells.fill {|x,y| Cell.new(self, x, y)}cells
    x = 0
    @cells.each do |col|
      puts x
      col.fill {|y| Cell.new(self, x, y)}
      x += 3
    end
  end
  
  def tick!
    tmp_cells = []
    self.cells.each do |col|
      col.each do |cell|
        
        if cell.live?
          if cell.neighbors.count < 2 # Rule 1
            cell.live = false
          elsif (cell.neighbors.count == 2) || (cell.neighbors.count == 3) # Rule 2 
            live_cells.push cell
            cell.live = true
          elsif cell.neighbors.count > 3 # Rule 3
            cell.live = false
          end
        end
        
      end
    end
    
    self.cells = tmp_cells
  end

  
end