require 'spec_helper'

describe "World" do
  
  before(:each) do
    @world = World.new
  end
  
  it "should store a list of its cells" do
    cell1 = Cell.new(1, 2, @world)
    cell2 = Cell.new(3, 2, @world)
    @world.cells.should == [cell1, cell2]
  end
end