class Terminal
  attr_accessor :world, :pattern
  
  LIVE = "*"
  DEAD = "-"
  
  
  # ======= Utility functions =======
  
  def two_d_to_string
    #assumes that @world is set
    output = []
    cells = @world.cells.transpose
    cells.each do |col|
      line = ""
      col.each do |cell|
        cell.live? ? line << LIVE : line << " "
      end
      output << line
    end
    return output
  end
  
  def output_world
    #assumes that @world is set
    
    data = self.two_d_to_string
    data.each do |d|
      puts d
    end
  end
  
  def pattern_to_a(pattern)
    # => recieves a (validated) pattern as input
    # => ouputs a 2d array of true/false values properly formated for game of life
    arr = []
    pattern.each do |line|
      row = []
      line.each_char do |char|
        char == LIVE ? row << true : row << false
      end
      arr << row
    end
    arr.transpose 
  end
  
  def valid_pattern?(line)
    (/[^#{LIVE}#{DEAD}]/ =~ line).nil? ? true : false
  end
  
  def advance_world(x)
    x.times do
      @world.tick!
    end
  end
  
  def random_pattern
    pattern = []
    @world.height.times do
      line = ""
      @world.width.times do
        rand(2) == 0 ? line << LIVE : line << DEAD 
      end
      pattern << line
    end
    puts "- #{pattern} -"
    return pattern
  end
  
  # ======= User Interation Functions =========
  
  def init_width
    puts "Please enter the width of the world"
    width = gets.chop
    if width.to_i == 0
      init_width
    end
    width
  end
  
  def init_height
    puts "Please enter the height of the world"
    height = gets.chop
    if height.to_i == 0
      init_height
    end
    height
  end
  
  def init_world
    width = init_width
    height = init_height    
    
    self.world = World.new(width.to_i, height.to_i)
    puts "Congratulations! A new blank world (#{width}x#{height}) has been created"
  end
  
  def get_pattern_line
    line = gets.chomp!.slice(0..(@world.width-1))
    if valid_pattern?(line)
      return line
    else
      puts "You entered some invalid characters. Please try again"
      get_pattern_line
    end
  end
  
  def user_pattern
    pattern = []
    puts "Creating the initial pattern"
    puts "Please input #{@world.width} characters on each line where #{DEAD} represents a dead cell and #{LIVE} represents a live cell"
    @world.height.times do
      line = get_pattern_line
      pattern << line
    end
    pattern
  end
  
  def init_cells
    puts "Want to use a computer generated pattern? [y/n]"
    option = gets.chomp
    option.downcase == "y" ? pattern = random_pattern : pattern = user_pattern
    @pattern = pattern_to_a(pattern)
    @world.load_pattern(@pattern)
  end
  
  def new_game
    puts "== CREATING A NEW GAME =="
    init_world
    init_cells
    puts "Game successfully created - lets have some fun with cellular automata!"
    menu   
  end
  
  def view
    puts "== VIEWING THE CURRENT STATE OF THE WORLD =="
    output_world
    puts "View next generation? [Y/n]"
    option = gets.chomp
    if option.downcase == "y"
      advance_world(1)
      view
    end
    menu
  end
  
  def get_number
    gen = gets.chop
    if gen.to_i == 0
      puts "Not a number!"
      get_gen
    end
    gen.to_i
  end
  
  
  def view_future
    puts "Please enter how many generations fromt the current state you would like to advance the simulateion"
    x = get_number
    advance_world(x)
    puts "== VIEWING THE WORLD #{x} GENRATIONS FROM THE LAST CURRENT STATE =="
    output_world
    menu
  end
  
  def reset_game
    @world.load_pattern(@pattern)
    puts "Game has been reset"
  end
  
  def menu
    puts "Please choose an option below by typing its number"
    puts "[1] Start a new game"
    puts "[2] View the current state of the world"
    puts "[3] View the world after X generations"
    puts "[4] Reset to generation 0"
    puts "[5] Exit"
    option = gets.chomp
    
    if option == "1"
      new_game
    elsif option == "2"
      view
    elsif option == "3"
      view_future
    elsif option == "4"
      reset_game
    elsif option == "5"
      puts "Thank-you for using my game of life simulation :)"
      exit
    else
      menu
    end
  end
end