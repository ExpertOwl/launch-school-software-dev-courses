CARD_NAMES = %w(Ace Two Three Four Five Six
                Seven Eight Nine Ten Jack Queen King)
NUMBER_OF_SUITS = 4
MAX_POINTS = 21
CARD_VALUES = { 'Two' => 2,
                'Three' => 3,
                'Four' => 4,
                'Five' => 5,
                'Six' => 6,
                'Seven' => 7,
                'Eight' => 8,
                'Nine' => 9,
                'Ten' => 10,
                'Jack' => 10,
                'Queen' => 10,
                'King' => 10,
                'Ace' => 11 }
DEALER_HIT_UNTIL_ABOVE = 17
ROUNDS_TO_WIN = 5

def prompt(message)
  puts "  => #{message}"
end

def clear_terminal
  system('clear')
end

def initialize_deck
  deck = CARD_NAMES * NUMBER_OF_SUITS
  deck.shuffle! # I love this so much
end

def deal_initial_cards(dealer_hand, player_hand, deck)
  draw_card(player_hand, deck)
  draw_card(dealer_hand, deck)
  draw_card(dealer_hand, deck)
  draw_card(player_hand, deck)
end

def draw_card(hand, deck)
  hand.append(deck.shift)
end

def get_player_choice(player_hand, dealer_hand)
  player_choice = nil
  loop do
    print_player_turn_info(player_hand, dealer_hand)
    player_choice = gets.chomp.downcase
    break if player_choice.start_with?('h') || player_choice.start_with?('s')
    clear_terminal
    prompt('Please input (h)it or (s)tay')
  end
  player_choice
end

def print_player_turn_info(player_hand, dealer_hand)
  prompt("The Dealer has: #{dealer_hand[-1]}, and an unknown Card")
  prompt("You have: #{to_sentence(player_hand)}")
  prompt('(h)it or (s)tay?')
end

def to_sentence(hand)
  if hand.length == 2
    "#{hand[0]} and #{hand[1]}"
  else
    "#{hand[0..-2].join(', ')}, and #{hand[-1]}"
  end
end

def dealer_turn(dealer_hand, deck)
  dealer_score = nil
  loop do
    prompt("Dealer has #{to_sentence(dealer_hand)}")
    dealer_score = calculate_points_in_hand(dealer_hand)
    break if dealer_score > DEALER_HIT_UNTIL_ABOVE
    prompt("Dealer hits on #{dealer_score}")
    draw_card(dealer_hand, deck)
  end
  dealer_score
end

def calculate_points_in_hand(hand)
  total = 0
  num_aces = hand.count("Ace")
  hand.each do |card|
    total += CARD_VALUES[card]
  end
  num_aces.times do
    total -= 10 if total > MAX_POINTS
  end
  total
end

def game_result(player_score, dealer_score)
  if bust?(player_score)
    :player_bust
  elsif bust?(dealer_score)
    :dealer_bust
  else
    compare_scores(player_score, dealer_score)
  end
end

def bust?(points)
  points > MAX_POINTS
end

def compare_scores(player_score, dealer_score)
  case player_score <=> dealer_score
  when 1
    :player_win
  when -1
    :dealer_win
  when 0
    :draw
  end
end

def winner?(player_rounds_won, dealer_rounds_won)
  [player_rounds_won, dealer_rounds_won].max == ROUNDS_TO_WIN
end

def print_welcome_msg
  prompt("Welcome to #{MAX_POINTS}")
  prompt("Closest to #{MAX_POINTS} without busting wins the round")
  prompt("Best #{ROUNDS_TO_WIN} of #{(ROUNDS_TO_WIN * 2) - 1} wins the game!")
end

def print_start_round_msg(round_number)
  prompt("-------")
  prompt("Round #{round_number}")
  prompt("-------")
end

def print_round_hands(player_hand, dealer_hand)
  prompt('Final Hands:')
  prompt("Player has #{to_sentence(player_hand)}.")
  prompt("Dealer has  #{to_sentence(dealer_hand)}.")
end

def print_round_scores(player_score, dealer_score)
  prompt('Final Scores This Round:')
  prompt("Player: #{player_score}.")
  prompt("Dealer: #{dealer_score}.")
end

def print_rounds_won(player_rounds_won, dealer_rounds_won)
  prompt("Rounds won:")
  prompt("Player: #{player_rounds_won}, Dealer: #{dealer_rounds_won}")
end

def print_winner(result)
  case result
  when :player_bust
    prompt('You busted. Dealer wins!')
  when :dealer_bust
    prompt('Dealer busted. You win!')
  when :player_win
    prompt('You win!')
  when :dealer_win
    prompt("Dealer wins!")
  when :draw
    prompt('It\'s a Draw!')
  end
end

def print_end_of_game_msg(result, player_rounds_won, dealer_rounds_won)
  prompt("We have a winner!")
  prompt("Player: #{player_rounds_won}, Dealer: #{dealer_rounds_won}")
  print_winner(result)
  prompt('Would you like to play again? (y/n)')
end

def print_continue_msg
  prompt("Press Enter to continue...")
  gets.chomp
end

loop do
  print_welcome_msg
  player_rounds_won = 0
  dealer_rounds_won = 0
  round = 1
  loop do
    print_start_round_msg(round)
    print_rounds_won(player_rounds_won, dealer_rounds_won) if round > 1
    player_hand = []
    dealer_hand = []
    deck = initialize_deck
    deal_initial_cards(dealer_hand, player_hand, deck)
    player_score = 0
    dealer_score = 0

    # player turn
    player_choice = ''
    until player_choice.start_with?('s') || bust?(player_score)
      player_choice = get_player_choice(player_hand, dealer_hand)
      if player_choice.start_with?('h')
        clear_terminal
        draw_card(player_hand, deck)
        prompt("You drew #{player_hand[-1]}")
      end
      player_score = calculate_points_in_hand(player_hand)
    end

    if bust?(player_score)
      prompt('You Busted!')
      dealer_score = calculate_points_in_hand(dealer_hand)
    else
      clear_terminal
      prompt("You stay on #{player_score}")
      dealer_score = dealer_turn(dealer_hand, deck)
      if bust?(dealer_score)
        prompt('Dealer Busted!')
      else
        prompt("Dealer Stays on #{dealer_score}")
      end
    end

    round_result = game_result(player_score, dealer_score)
    case round_result
    when :player_bust, :dealer_win
      dealer_rounds_won += 1
    when :dealer_bust, :player_win
      player_rounds_won += 1
    end
    print_round_hands(player_hand, dealer_hand)
    print_round_scores(player_score, dealer_score)
    print_winner(round_result)
    print_rounds_won(player_rounds_won, dealer_rounds_won)
    print_continue_msg
    clear_terminal
    break if winner?(player_rounds_won, dealer_rounds_won)
    round += 1
  end
  result = compare_scores(player_rounds_won, dealer_rounds_won)
  print_end_of_game_msg(result, player_rounds_won, dealer_rounds_won)
  break unless gets.chomp.downcase.start_with?('y')
  clear_terminal
end

prompt('Thanks for playing!')
