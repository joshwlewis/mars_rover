require "test/unit"
require "rover"
class RoverTest < Test::Unit::TestCase
  def setup
    @rover=Rover.new
  end

  def test_dave_mccullars_navigation
    @rover.map_size = "4 6"
    @rover.initial_position = "1 1 N"
    @rover.instructions = "M4LMLM3R7"
    @rover.execute
    assert_equal(@rover.position,"0 2 E")
  end
  
  def test_nasa_navigation_1
    @rover.map_size = "5 5"
    @rover.initial_position = "1 2 N"
    @rover.instructions = "LMLMLMLMM"
    @rover.execute
    assert_equal(@rover.position,"1 3 N")
  end
  
  def test_nasa_navigation_2
    @rover.map_size = "5 5"
    @rover.initial_position = "3 3 E"
    @rover.instructions = "MMRMMRMRRM"
    @rover.execute
    assert_equal(@rover.position,"5 1 E")
  end
  
end
