def prompt(message)
  puts("=> #{message}")
end

def player_choice
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    LETTER_CODE_TO_CHOICE.each_pair { |key, value| prompt "For #{value}, enter #{key}" }
    choice = gets.chomp.strip
    choice = LETTER_CODE_TO_CHOICE[choice.to_sym] if LETTER_CODE_TO_CHOICE[choice.to_sym]
    break if VALID_CHOICES.include?(choice)

    prompt('That\'s not a valid choice')
  end
  choice
end

def return_results(choice, computer_choice)
  if win?(choice, computer_choice)
    'player'
  elsif win?(computer_choice, choice)
    'computer'
  else
    'tie'
  end
end

def win?(p1_choice, p2_choice)
  KEY_BEATS_VALUE[p1_choice.to_sym].to_a.include?(p2_choice)
end

def display_round_results(winner)
  case winner
  when 'player'
    prompt 'You win this round!'
  when 'computer'
    prompt 'You lose this round!'
  when 'tie'
    prompt 'This round is a tie!'
  end
end

def update_score(score, winner)
  score[winner.to_sym] += 1 unless winner == 'tie'
  score
end

def someome_has_three_points?(score)
  score.any? { |_, value| value == 3 }
end

def display_game_winner(round_winner)
  case round_winner
  when 'player'
    prompt "You've won the game!"
  when 'computer'
    prompt 'The computer has won the game!'
  end
end

VALID_CHOICES = %w[rock paper scissors lizard spock].freeze

LETTER_CODE_TO_CHOICE = {
  r: 'rock', \
  p: 'paper', \
  l: 'lizard', \
  sp: 'spock', \
  sc: 'scissors' \
}.freeze

KEY_BEATS_VALUE = {
  rock: %w[lizard scissors], \
  paper: %w[rock spock], \
  scissors: %w[paper lizard], \
  lizard: %w[spock paper], \
  spock: %w[rock scissors] \
}.freeze

loop do
  score = { player: 0, computer: 0 }
  prompt('First to three wins!')
  round_winner = ''
  loop do
    choice = player_choice
    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{choice}, computer chose #{computer_choice}")
    round_winner = return_results(choice, computer_choice)
    display_round_results(round_winner)
    score = update_score(score, round_winner)
    prompt("The score is #{score}")
    break if someome_has_three_points?(score)
  end
  prompt(display_game_winner(round_winner))
  prompt('Would you like to play again? (Y or y to play)')
  continue = gets.chomp.downcase
  break unless continue == 'y'
end
prompt('Goodbye!')
