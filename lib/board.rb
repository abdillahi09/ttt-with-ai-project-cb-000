class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end

  def valid_move?(index)
    index = index.to_i
    if index.is_a? Integer
      index.between?(1,9) && !taken?(index)
    else
      false
    end
  end

  def update(index,player)
    @cells[index.to_i-1] = player.token
  end

end
