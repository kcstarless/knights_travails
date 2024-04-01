BOARD_SIZE = [0, 1, 2, 3, 4, 5, 6, 7]

attr_accessor :board, :queue_moves, :made_moves

def initialize
  @board = populate_board
  @queue_moves = []
  @made_moves = []
end

def populate_board
  array = []
  BOARD_SIZE.repeated_permutation(2) { |combo| array << combo }
  array
end

def knights_move(start, target)
  @queue_moves << start

  until @queue_moves.empty?
    start = @queue_moves.shift

    unless @made_moves.include?(start)
      @made_moves << start
      aNode = Node.new(start)
    end

    return @made_moves if start == target

    @queue_moves << [start[0] + 2, start[1] + 1] if @board.include?([start[0] + 2, start[1] + 1])
    @queue_moves << [start[0] + 2, start[1] - 1] if @board.include?([start[0] + 2, start[1] - 1])

    @queue_moves << [start[0] - 2, start[1] + 1] if @board.include?([start[0] - 2, start[1] + 1])
    @queue_moves << [start[0] - 2, start[1] - 1] if @board.include?([start[0] - 2, start[1] - 1])

    @queue_moves << [start[0] + 1, start[1] + 2] if @board.include?([start[0] + 1, start[1] + 2])
    @queue_moves << [start[0] - 1, start[1] + 2] if @board.include?([start[0] - 1, start[1] + 2])

    @queue_moves << [start[0] + 1, start[1] - 2] if @board.include?([start[0] + 1, start[1] - 2])
    @queue_moves << [start[0] - 1, start[1] - 2] if @board.include?([start[0] - 1, start[1] - 2])
  end
end
