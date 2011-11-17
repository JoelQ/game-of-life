require 'spec_helper'

describe "Terminal" do
  before(:each) do
    @terminal = Terminal.new
  end
  # it "should convert the world.cells 2d array into an array of lines" do
  #   @terminal.world = World.new(4,3)
  #   @terminal.output_world
  #   @terminal.two_d_to_string.should == [" "*4, " "*4, " "*4]
  # end
  # 
  # it "should convert user pattern to a 2d array of true/false values" do
  #   live = Terminal::LIVE
  #   dead = Terminal::DEAD
  #   u_pattern = ["#{live}#{live}", "#{dead}#{dead}"]
  #   @terminal.pattern_to_a(u_pattern).should == [[true, false], [true, false]]
  # end
end