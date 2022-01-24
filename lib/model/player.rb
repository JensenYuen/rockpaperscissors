# frozen_string_literal: true

require 'pry-byebug'

# Model for player
class Player
  attr_accessor :current_choice, :cpu

  def initialize
    @current_choice = ''
    @cpu = false
  end

  def assign_hand
    hands = %w[rock paper scissors]
    @current_choice = @current_choice.to_i
    @current_choice = hands[@current_choice - 1]
  end

  def cpu?
    @cpu = true
    cpu_hand
  end

  private

  def cpu_hand
    hands = %w[rock paper scissors]
    @current_choice = hands.sample
  end
end
