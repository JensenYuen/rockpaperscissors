# frozen_string_literal: true

require 'pry-byebug'
require_relative '../model/player'
require_relative '../view/game_view'

# controller that controls the logic of the gmae
class Gamecontroller
  def initialize
    @view = GameView.new
  end

  def game_start
    # prints avaliable options for player
    @view.start_option
  end

  def game_options(player_option)
    case player_option
    when '1'
      # initialize player models
      player_vs_cpu
      pick_hand
    when '2'
      # initialize player models
      cpu_vs_cpu
      # redirects to winning_hand method
      winning_hand(@cpu_one, @cpu_two)
    else
      # invalid option message will print
      @view.invalid_option_message(player_option)
    end
  end

  def pick_hand
    # Ask the player to pick between rock, paper & scissors
    @view.pick_a_hand_message
    print "\nPick your hand (1 - 3): "
    player_hand = gets.chomp
    compare_hands if valid_hand?(player_hand)
  end

  def valid_hand?(player_hand)
    if player_hand == '1' || player_hand == '2' || player_hand == '3'
      @player.current_choice = player_hand
      @player.assign_hand
    else
      @view.invalid_hand_message(player_hand)
    end
  end

  def compare_hands
    winning_hand(@player, @cpu_two)
  end

  def round_over
    @view.play_again_message
    print "\nYour option (y/n) : "
    player_choice = gets.chomp
    play_again?(player_choice)
  end

  def end_game
    @view.end_game_message
  end

  private

  def player_vs_cpu
    @player = Player.new
    @cpu_two = Player.new
    @cpu_two.cpu?
  end

  def cpu_vs_cpu
    @cpu_one = Player.new
    @cpu_two = Player.new
    @cpu_one.cpu?
    @cpu_two.cpu?
  end

  def winning_hand(player, computer)
    player_hand = player.current_choice
    cpu_hand = computer.current_choice
    # checks for tie
    if player_hand == cpu_hand
      @view.draw_message
    else
      # checks for rock
      # Rock loses to paper, beats scissors
      if player_hand == 'rock'
        @view.user_display
        @view.left_rock
        @view.cpu_display
        if cpu_hand == 'paper'
          @view.right_paper
          @view.lose_message
        else
          @view.right_scissors
          @view.win_message
        end
      end
      # checks for paper
      # paper loses to scissors, beats rock
      if player_hand == 'paper'
        @view.user_display
        @view.left_paper
        @view.cpu_display
        if cpu_hand == 'scissors'
          @view.right_scissors
          @view.lose_message
        else
          @view.right_rock
          @view.win_message
        end
      end
      # checks for scissors
      # scissors loses to rock, beats paper
      if player_hand == 'scissors'
        @view.user_display
        @view.left_scissors
        @view.cpu_display
        if cpu_hand == 'rock'
          @view.right_rock
          @view.lose_message
        else
          @view.right_paper
          @view.win_message
        end
      end
    end
  end

  def play_again?(player_choice)
    return player_choice if player_choice == 'y'
  end
end
