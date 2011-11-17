require 'spec_helper'

describe "Pattern" do
  before(:each) do
    @world = World.new(2,2)
    @pattern = Pattern.new(2,2)
  end
  
  it "should convert a 2d array to a gol (game of life) screen output" do
    @world.cells[1][1].live!
    Pattern.two_d_to_string(@world).should == ["  ", " *"]
  end
  
  it "should convert user pattern to a 2d array of true/false values" do
    live = Pattern::LIVE
    dead = Pattern::DEAD
    @pattern.pattern = ["#{live}#{live}", "#{dead}#{dead}"]
    @pattern.pattern_to_a.should == [[true, false], [true, false]]
  end
end