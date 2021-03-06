require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_message'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_cpu_cruiser
    game      = Game.new
    cpu_board = Board.new
    cruiser   = Ship.new("Cruiser", 3)
    sub       = Ship.new("Submarine", 2)

    assert_equal true, game.cpu_random_coordinates(cruiser)
  end

  def test_player_ship_placement
    game      = Game.new
    cpu_board = Board.new
    cruiser   = Ship.new("Cruiser", 3)
    sub       = Ship.new("Submarine", 2)
  end
end
