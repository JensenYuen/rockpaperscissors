# frozen_string_literal: true

# Displays all text and messages
class GameView
  # ============ Start of methods for printing messages ==================
  def start_option
    puts "\nChoose an option"
    puts '1. Play against the computer (CPU)'
    puts '2. Watch CPU vs CPU'
    puts '3. Stop playing'
  end

  def invalid_option_message(player_option)
    puts `clear`
    puts "'#{player_option}' is not valid, Please enter a number between 1 - 3."
  end

  def invalid_hand_message(player_hand)
    puts `clear`
    puts "'#{player_hand}' is an invalid hand, the CPU has won by default"
  end

  def pick_a_hand_message
    puts `clear`
    puts "Game has started! Please pick a number between 1 - 3\n"
    puts '1. Rock'
    puts '2. Paper'
    puts '3. Scissors'
  end

  def user_display
    puts '===== Your hand ====='
  end

  def cpu_display
    puts "===== Cpu's hand ====="
  end

  def win_message
    puts "\nYou win!"
  end

  def lose_message
    puts "\nComputer won!"
  end

  def draw_message
    puts "\nIt is a tie!"
  end

  def play_again_message
    puts "\nWould you like to play again?"
  end

  def end_game_message
    puts "\n======================================="
    puts '======= Thank you for playing! ========'
    puts '======================================='
  end
  # ============ End of methods for printing messages ==================

  # ASCII art for Rock paper and scissors
  def left_rock
    left_rock = <<~HEREDOC
          _______
      ---'   ____)
            (_____)
            (_____)
            (____)
      ---.__(___)
    HEREDOC
    puts left_rock
  end

  def left_paper
    left_paper = <<~HEREDOC
          _______
      ---'   ____)____
                ______)
                _______)
              _______)
      ---.__________)
    HEREDOC
    puts left_paper
  end

  def left_scissors
    left_scissors = <<~HEREDOC
          _______
      ---'   ____)____
                ______)
            __________)
            (____)
      ---.__(___)
    HEREDOC
    puts left_scissors
  end

  def right_rock
    right_rock = <<~HEREDOC
        _______
       (____   '---
      (_____)
      (_____)
       (____)
        (___)__.---
    HEREDOC
    puts right_rock
  end

  def right_paper
    right_paper = <<~HEREDOC
            ________
       ____(____    '---
      (______
      (_______
      (_______
       (__________.---
    HEREDOC
    puts right_paper
  end

  def right_scissors
    right_scissors = <<~HEREDOC
             _______
       _____(____   '---
      (_______
      (__________
            (____)
             (___)__.---
    HEREDOC
    puts right_scissors
  end
end
