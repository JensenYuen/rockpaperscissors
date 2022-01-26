# frozen_string_literal: true

require 'pry-byebug'
require_relative '../model/player'
require_relative '../view/game_view'

# controller that controls the logic of the gmae
class GameController
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
      # redirects to pick_hand method
      # pick_hand
    when '2'
      # initialize player models
      cpu_vs_cpu
      # redirects to winning_hand method
      compare_hands(@cpu_one, @cpu_two)
    else
      # invalid option message will print
      @view.invalid_option_message(player_option)
    end
  end

  def pick_hand
    # Ask the player to pick between rock, paper & scissors
    @view.pick_a_hand_message
    # Checks if valid hand was picked
    return unless valid_hand?(player_hand)

    # Checks if both hands match
    return tie_hand(@player, @cpu) if tie?(@player, @cpu)

    compare_hands(@player, @cpu)
  end

  def round_over
    @view.play_again_message
  end

  def play_again?(player_choice)
    player_choice if player_choice == 'y'
  end

  def end_game
    @view.end_game_message
  end

  private

  def player_vs_cpu
    @player = Player.new('Player')
    @cpu = Player.new('CPU')
    @cpu.cpu
  end

  def cpu_vs_cpu
    @cpu_one = Player.new('CPU 1')
    @cpu_two = Player.new('CPU 2')
    @cpu_one.cpu
    @cpu_two.cpu
  end

  def valid_hand?(player_hand)
    if %w[1 2 3].include?(player_hand)
      @player.current_choice = player_hand
      @player.assign_hand
    else
      @view.invalid_hand_message(player_hand)
    end
  end

  def compare_hands(left_player, right_player)
    # left player can be real player or cpu
    # right player is always a cpu
    left_player_hand = left_player.current_choice
    right_player_hand = right_player.current_choice
    @view.game_display(left_player.name, right_player.name)
    # Always evalutes the winner from the standpoint of the left player
    case left_player_hand
    when 'rock'
      rock_win?(right_player_hand) ? @view.rock_win(left_player.name) : @view.rock_lose(right_player.name)
    when 'paper'
      paper_win?(right_player_hand) ? @view.paper_win(left_player.name) : @view.paper_lose(right_player.name)
    else
      scissors_win?(right_player_hand) ? @view.scissors_win(left_player.name) : @view.scissors_lose(right_player.name)
    end
  end

  def tie_hand(left_player, right_player)
    # displays a tie message
    @view.game_display(left_player.name, right_player.name)
    tie_hand = left_player.current_choice
    case tie_hand
    when 'rock'
      @view.rock_tie
    when 'paper'
      @view.paper_tie
    else
      @view.scissors_tie
    end
  end

  def tie?(left_player, right_player)
    # returns true when both hands are the same
    left_player.current_choice == right_player.current_choice
  end

  # win conditions for player
  # rock beats scissors
  # paper beats rock
  # scissors beats paper
  # lose for any other combination

  def rock_win?(right_player_hand)
    # return true if right player has scissors
    # return false if right player has paper
    right_player_hand == 'scissors'
  end

  def paper_win?(right_player_hand)
    # return true if right player has rock
    # return false if right player has scissors
    right_player_hand == 'rock'
  end

  def scissors_win?(right_player_hand)
    # return true if right player has paper
    # return false if right player has rock
    right_player_hand == 'paper'
  end
end
