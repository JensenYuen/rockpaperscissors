# frozen_string_literal: true

# Displays all text and messages
class GameView
  # ============ Start of methods for printing messages ==================
  def start_option
    puts "\nChoose an option to start playing"
    puts '1. Play against the computer (CPU)'
    puts '2. Watch CPU vs CPU'
    puts '3. Stop playing'
  end

  def invalid_option_message(player_option)
    puts "\n'#{player_option}' is invalid, Please enter a number between 1 - 3."
  end

  def invalid_hand_message(player_hand)
    puts "\n'#{player_hand}' is an invalid hand, the CPU has won by default"
  end

  def pick_a_hand_message
    puts `clear`
    puts "Game has started! Please pick a number between 1 - 3\n"
    puts '1. Rock'
    puts '2. Paper'
    puts '3. Scissors'
  end

  def game_display(player_left, player_right)
    puts "\n===== #{player_left}'s hand ===== ===== #{player_right}'s hand ====="
  end

  def win_message(player)
    puts "\n-----------------> #{player} won! <-----------------"
  end

  def tie_message
    puts "\n-----------------> It's a tie! <-----------------"
  end

  def play_again_message
    puts "\nWould you like to play again?"
    puts "'y' to play again, enter any other key to stop playing"
  end

  def end_game_message
    puts "\n======================================="
    puts '======= Thank you for playing! ========'
    puts '======================================='
  end
  # ============ End of methods for printing messages ==================

  # ========== start of ASCII art for Rock paper and scissors ==========
  # =================== hands that result in winning ===================
  def rock_win(player)
    rock_win = <<~HEREDOC
          _______                         _______
      ---'   ____)                  _____(____   '---
            (_____)                (_______
            (_____)               (__________
            (____)                      (____)
      ---.__(___)                        (___)__.---
    HEREDOC
    puts rock_win
    win_message(player)
  end

  def paper_win(player)
    paper_win = <<~HEREDOC
          _______                        _______
      ---'   ____)____                  (____   '---
                ______)                (_____)
                _______)               (_____)
               _______)                 (____)
      ---.__________)                    (___)__.---
    HEREDOC
    puts paper_win
    win_message(player)
  end

  def scissors_win(player)
    scissors_win = <<~HEREDOC
          _______                       ________
      ---'   ____)____             ____(____    '---
                ______)           (______
             __________)         (_______
            (____)                (_______
      ---.__(___)                    (__________.---
    HEREDOC
    puts scissors_win
    win_message(player)
  end

  # =================== hands that results in losing ===================
  def rock_lose(player)
    rock_lose = <<~HEREDOC
          _______                       ________
      ---'   ____)                 ____(____    '---
            (_____)               (______
            (_____)              (_______
            (____)                (_______
      ---.__(___)                    (__________.---
    HEREDOC
    puts rock_lose
    win_message(player)
  end

  def paper_lose(player)
    paper_lose = <<~HEREDOC
          _______                         _______
      ---'   ____)____              _____(____   '---
                ______)            (_______
                _______)          (__________
               _______)                 (____)
      ---.__________)                    (___)__.---
    HEREDOC
    puts paper_lose
    win_message(player)
  end

  def scissors_lose(player)
    scissors_lose = <<~HEREDOC
          _______                        _______
      ---'   ____)____                  (____   '---
                ______)                (_____)
             __________)               (_____)
            (____)                      (____)
      ---.__(___)                        (___)__.---
    HEREDOC
    puts scissors_lose
    win_message(player)
  end

  # =================== hands that resulted in a tie ===================
  def rock_tie
    rock_tie = <<~HEREDOC
          _______                       _______
      ---'   ____)                     (____   '---
            (_____)                   (_____)
            (_____)                   (_____)
            (____)                     (____)
      ---.__(___)                       (___)__.---
    HEREDOC
    puts rock_tie
    tie_message
  end

  def paper_tie
    paper_tie = <<~HEREDOC
          _______                      ________
      ---'   ____)____            ____(____    '---
                ______)          (______
                _______)        (_______
               _______)          (_______
      ---.__________)               (__________.---
    HEREDOC
    puts paper_tie
    tie_message
  end

  def scissors_tie
    scissors_tie = <<~HEREDOC
          _______                       _______
      ---'   ____)____            _____(____   '---
                ______)          (_______
             __________)        (__________
            (____)                    (____)
      ---.__(___)                      (___)__.---
    HEREDOC
    puts scissors_tie
    tie_message
  end
  # =========== End of ASCII art for Rock paper and scissors ===========
end
