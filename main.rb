# 30/03/2024 Knights Travails

require_relative 'lib/board'

board = KnightSquare.new

board.knights_move([0, 7], [4, 4]).each { |path| p path }
