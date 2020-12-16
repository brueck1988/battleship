require './lib/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = { "A1" => Cell.new("A1"),
               "A2" => Cell.new("A2"),
               "A3" => Cell.new("A3"),
               "A4" => Cell.new("A4"),
               "B1" => Cell.new("B1"),
               "B2" => Cell.new("B2"),
               "B3" => Cell.new("B3"),
               "B4" => Cell.new("B4"),
               "C1" => Cell.new("C1"),
               "C2" => Cell.new("C2"),
               "C3" => Cell.new("C3"),
               "C4" => Cell.new("C4"),
               "D1" => Cell.new("D1"),
               "D2" => Cell.new("D2"),
               "D3" => Cell.new("D3"),
               "D4" => Cell.new("D4")
 }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate) && !@cells[coordinate].fired_upon?
  end


  def coordinates_equal_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def all_numbers_alike(coordinates)
    @hor = coordinates.map{|coordinate|coordinate[1]}.map(&:to_i)
    @hor.each_cons(2).all?{|a,b| b == a}
  end

  def all_letters_alike(coordinates)
    @ver = coordinates.map{|coordinate|coordinate[0]}.map(&:ord)
    @ver.each_cons(2).all?{|a,b| b == a}
  end

  def horizontal?(coordinates)
    @hor = coordinates.map{|coordinate|coordinate[1]}.map(&:to_i)
    @hor.each_cons(2).all?{|a,b| b == a + 1}
  end

  def vertical?(coordinates)
    @ver = coordinates.map{|coordinate|coordinate[0]}.map(&:ord)
    @ver.each_cons(2).all?{|a,b| b == a + 1}
  end

  def cell_empty(coordinates)
    coordinates.all? {|cell| @cells[cell].empty?}
  end

  def consecutive_placement(coordinates)
    if all_letters_alike(coordinates)
      horizontal?(coordinates)
    elsif all_numbers_alike(coordinates)
      vertical?(coordinates)
    else
      false
    end
  end

  def ship_coordinates_valid?(coordinates)
    coordinates.all? {|coordinate| valid_coordinate?(coordinate)}
  end

  def valid_placement?(ship, coordinates)
    consecutive_placement(coordinates)         &&
    ship.length == coordinates.length          &&
    ship_coordinates_valid?(coordinates)       &&
    cell_empty(coordinates)                    
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.map{|coord| @cells[coord].place_ship(ship)}
    end
  end

  def render(option = false)
    if option == true
      "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    else
      "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    end
  end

end
