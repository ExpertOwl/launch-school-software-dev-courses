require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +  # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +  # col
                [[1, 5, 9], [3, 5, 7]] # diag

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(elements, joining_symbol = ', ', last_symbol = 'or ')
  str_out = ''

  if elements.length == 1
    str_out << elements.shift.to_s
  else
    while elements.length > 1
      str_out << "#{elements.shift}#{joining_symbol}"
    end
    str_out << "#{last_symbol} #{elements.shift}"
  end
  str_out
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  puts ''
  puts '     |     |'
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}   "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}   "
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}   "
  puts '     |     |'
end
# rubocop:enable Metrics/AbcSize

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def board_full?(board)
  empty_squares(board).empty?
end

def alternate_player(current_player)
  case current_player
  when 'Player'
    'Computer'
  when 'Computer'
    'Player'
  end
end

def place_piece(board, current_player)
  case current_player
  when 'Player'
    player_places_piece(board)
  when 'Computer'
    computer_places_piece(board)
  end
end

def player_places_piece(board)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(board))}")
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt("Sorry, that's not a valid choice")
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece(board)
  square = find_near_win(board, COMPUTER_MARKER)
  if !square
    square = find_near_win(board, PLAYER_MARKER)
  end
  if !square && center_free?(board)
    square = 5
  end
  if !square
    square = empty_squares(board).sample
  end
  board[square] = COMPUTER_MARKER
end

def find_near_win(board, marker)
  WINNING_LINES.each do |line|
    values = board.values_at(*line)
    if values.count(marker) == 2 && values.count(INITIAL_MARKER) == 1
      return line[values.index(INITIAL_MARKER)]
    end
  end
  nil
end

def center_free?(board)
  board[5] == INITIAL_MARKER
end

def winner?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  prompt "You are #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  board = initialize_board
  current_player = 'Player'
  loop do
    display_board(board)
    place_piece(board, current_player)
    current_player = alternate_player(current_player)
    break if winner?(board) || board_full?(board)
  end

  display_board(board)
  if winner?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt 'It\'s a tie!'
  end
  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt 'Thanks for playing!'
