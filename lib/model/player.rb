# frozen_string_literal: true

require 'pry-byebug'

# Model for player
class Player
  HANDS = %w[rock paper scissors].freeze
  attr_accessor :current_choice, :cpu

  def initialize
    @current_choice = ''
    @cpu = false
  end

  def assign_hand
    # converts string to integer to assign the correct hand to player
    @current_choice = @current_choice.to_i
    @current_choice = HANDS[@current_choice - 1]
  end

  def cpu?
    # changes @cpu to true and assigns a random hand to CPU
    @cpu = true
    cpu_hand
  end

  private

  def cpu_hand
    @current_choice = HANDS.sample
  end
end
