class Terminal

  require_relative 'constants.rb'
  include Constants
  
  attr_accessor :world, :pattern
  
  # ======= Pattern and array manipulation
  
  def output_world
    #assumes that @world is set    
    data = Pattern.two_d_to_string(@world)
    data.each do |d|
      puts d
    end
  end
  
  def valid_pattern?(line)
    (/[^#{LIVE}#{DEAD}]/ =~ line).nil? ? true : false
  end
  
  def user_pattern
    arr = []
    puts "Creating the initial pattern"
    puts "Please input #{@world.width} characters on each line where #{DEAD} represents a dead cell and #{LIVE} represents a live cell"
    @world.height.times do
      line = get_pattern_line
      arr << line
    end
    pat = Patern.new(@world.width, @world.height)
    pat.patern = arr
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
  
  # ======= Utility functions =======
  
  def get_number
    # gets user input and validates its numericality, user is prompted for input 
    # => until a valid number is entered
    num = gets.chop.to_i
    if num == 0
      puts "Not a number! Please try again"
      get_number
    else
      return num
    end
  end
  
  def bool_choice?(message)
    puts "#{message} [Y/n]"
    option = gets.chomp
    option.downcase == "y" ? true : false
  end
  
  def advance_world(x)
    x.times do
      @world.tick!
    end
  end
  
  def next_gen
    choice = bool_choice?("View next generation?")
    if choice
      advance_world(1)
      view
    end
  end

  
  # ======= User Interation Functions =========
  
  def init_world
    puts "Please enter the width of the world"
    width = get_number
    puts "Please enter the height of the world"
    height = get_number    
    
    self.world = World.new(width.to_i, height.to_i)
    puts "Congratulations! A new blank world (#{width}x#{height}) has been created"
  end
  
  def init_cells
    choice = bool_choice?("Want to use a computer generated pattern?")
    choice ? @pattern = Patern.random(@world.width, @world.height) : @pattern = user_pattern
    @world.load_pattern(@pattern.to_a)
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
    next_gen
    menu
  end  
  
  def view_future
    puts "Please enter how many generations fromt the current state you would like to advance the simulateion"
    x = get_number
    advance_world(x)
    puts "== VIEWING THE WORLD #{x} GENRATIONS FROM THE LAST CURRENT STATE =="
    output_world
    next_gen
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