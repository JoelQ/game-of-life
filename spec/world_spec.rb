require 'spec_helper'

describe "World" do
  
  before(:each) do
    @world = World.new(3,3)
  end
  
  it "should be able to get and set its cells" do
    cell = @world.cells[1][1]
    cell.live = true
    @world.cells[1][1].live.should === true
  end
  
  it "should have an index method" do
    cell = @world.cells[1][1]
    cell.x.should == 1
    cell.y.should == 1
  end

end