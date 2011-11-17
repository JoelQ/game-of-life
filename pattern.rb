class Pattern
  require_relative 'constants.rb'
  include Constants
  
  attr_accessor :pattern, :height, :width
  
  # === Class methods ===
  
  def initialize(x, y)
    @pattern = ["#{DEAD*x}"*y]
    @width = x
    @height = y
  end
  
  def self.random(width, height)
    arr = []
    height.times do
      line = ""
      width.times do
        rand(2) == 0 ? line << LIVE : line << DEAD 
      end
      pattern << line
    end
    pat = Pattern.new(width, height)
    pat.pattern = arr
    #puts "- #{pattern} -"
    return pat
  end
  
  def self.two_d_to_string(world)
    output = []
    cells = world.cells.transpose
    cells.each do |col|
      line = ""
      col.each do |cell|
        cell.live? ? line << LIVE : line << " "
      end
      output << line
    end
    return output
  end
  
  def pattern_to_a
    # converts the pattern object into an array of true/false values for the world object
    arr = []
    self.pattern.each do |line|
      row = []
      line.each_char do |char|
        char == LIVE ? row << true : row << false
      end
      arr << row
    end
    arr.transpose 
  end
end