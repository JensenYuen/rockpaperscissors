# frozen_string_literal: true

require_relative './controller/game_controller'

puts `clear`
puts '========================================'
puts 'Welcome to the Rock-Paper-Scissors game!'
puts '========================================'

running = true
rps = Gamecontroller.new

while running
  rps.game_start
  # Ask the player to pick from 3 options
  print "\nYour option (1 - 3): "
  player_option = gets.chomp
  if player_option == '3'
    # 3. Stop playing
    # Player picked option 3, stops the game
    running = false
    break
  elsif player_option == '1'
    rps.game_options(player_option)
    # 1. play against CPU
    # Player has picked option 1
    # Ask the player to pick between rock, paper & scissors
    print "\nPick your hand (1 - 3): "
    player_hand = gets.chomp
    rps.compare_hands if rps.valid_hand?(player_hand)
  end

  # 2. watch CPU vs CPU
  # Player has picked option 2
  # logic will be handled to controller
  # no code for interface

  # Ask player if they would like to play again
  rps.round_over
  print "\nYour option (y/n) : "
  player_choice = gets.chomp
  running = rps.play_again?(player_choice)
end
# Print the end of the game message
rps.end_game
