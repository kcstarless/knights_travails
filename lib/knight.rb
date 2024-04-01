# KnightSquare class which is representation of a Graph
class Knight
  def initialize
    @knight_moves = [[1, 2], [-1, 2], [2, 1], [2, 1], [1, - 2], [- 1, - 2], [- 2, 1], [- 2, - 1]]
  end

  def knights_move(start, target)
    queue = [[start]]
    visited = [start]

    until queue.empty?
      path = queue.shift
      current = path.last

      return path if current == target

      possible_moves(current).each do |next_position|
        unless visited.include?(next_position)
          visited << next_position
          queue << path + [next_position]
        end
      end
    end
  end

  def possible_moves(current)
    moves = []
    @knight_moves.each do |offset|
      x = current[0] + offset[0]
      y = current[1] + offset[1]
      moves << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    moves
  end
end
