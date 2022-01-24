# frozen_string_literal: true

require 'pry-byebug'

# Model for player
class Player
  VALID_HANDS = %w[rock paper scissors].freeze
  attr_accessor :current_choice, :name

  def initialize(name)
    @current_choice = ''
    @name = name
  end

  def assign_hand
    # converts string to integer to assign the correct hand to player
    @current_choice = @current_choice.to_i
    @current_choice = VALID_HANDS[@current_choice - 1]
  end

  def cpu
    # assigns a random hand to CPU
    cpu_hand
  end

  private

  def cpu_hand
    @current_choice = VALID_HANDS.sample
  end
end
