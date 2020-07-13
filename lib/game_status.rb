# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                    [0, 1, 2], # Top row
                    [3, 4, 5], # Middle row
                    [6, 7, 8], # Bottom row
                    [0, 4, 8], # Cross left
                    [2, 4, 6], # Cross right
                    [0, 3, 6], # Left column
                    [1, 4, 7], # Center column
                    [2, 5, 8], # Right column
                   ]
def won?(board)
    WIN_COMBINATIONS.detect { |combo|
      equal_positions?(board, combo) &&
      position_taken?(board, combo[0])
    }
end

def equal_positions?(board, combo)
  board[combo[0]] == board[combo[1]] &&
  board[combo[1]] == board[combo[2]]
end

def full? (board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw? (board)
  full?(board) && !won?(board)
end

def over? (board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
