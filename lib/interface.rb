# frozen_string_literal: true

require_relative './controller/game_controller'

puts `clear`
puts '========================================'
puts 'Welcome to the Rock-Paper-Scissors game!'
puts '========================================'

running = true
rps = GameController.new

while running
  # Ask the player to pick from 3 options
  # 1. play against CPU
  # 2. watch CPU vs CPU
  # 3. Stop playing
  rps.game_start
  print "\nYour option (1 - 3): "
  player_option = gets.chomp
  if player_option == '3'
    # Player picked option 3, stops the game
    running = false
  else
    # player input will be checked if valid
    rps.game_options(player_option)
  end
  # Player picked option 1
  if player_option == '1'
    print "\nPick your hand (1 - 3): "
    player_hand = gets.chomp
    rps.pick_hand(player_hand)
  end

  # Ask player if they would like to play again
  rps.round_over
  print "\nYour option : "
  player_choice = gets.chomp.downcase
  # returns true or false based on player choice
  running = rps.play_again?(player_choice)
  puts `clear`
end
# Print the end of the game message
rps.end_game
