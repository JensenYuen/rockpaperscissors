# frozen_string_literal: true

require_relative '../lib/controller/game_controller'
require_relative '../lib/model/player'
require_relative '../lib/view/game_view'
require 'pry-byebug'

RSpec.describe GameController do
  let(:rps) { GameController.new }
  let(:view) { GameView.new }

  describe '#initialize' do
    it 'Should initialize with an instance variable of GameView' do
      expect(rps
        .instance_variable_get(:@view))
        .to be_instance_of GameView
    end
  end

  describe '#game_options' do
    context "Player has selected option '1. Play against CPU'" do
      it 'Should initialize an instance of Player(player)' do
        rps.game_options('1')
        # rps.send(:valid_hand?, 1)
        expect(rps
          .instance_variable_get(:@player))
          .to be_instance_of Player
        expect(rps
          .instance_variable_get(:@cpu))
          .to be_instance_of Player
      end
    end
    context "Player has selected option '2. Watch CPU vs CPU'" do
      it 'Should initialize an instance of Player(CPU)' do
        rps.game_options('2')
        expect(rps
          .instance_variable_get(:@cpu_one))
          .to be_instance_of Player
        expect(rps
          .instance_variable_get(:@cpu_two))
          .to be_instance_of Player
      end
    end
    context 'Player has selected an option that is not valid' do
      it 'Should return a falsey message' do
        result = rps.game_options('e')
        expect(result).to be_falsey
      end
    end
  end

  describe '#Valid hand' do
    context 'Player has picked a valid hand' do
      it 'Should return true if valid hand' do
        rps.game_options('1')
        result = rps.send(:valid_hand?, '1')
        expect(result).to be_truthy
        result = rps.send(:valid_hand?, '2')
        expect(result).to be_truthy
        result = rps.send(:valid_hand?, '3')
        expect(result).to be_truthy
      end
    end
    context 'Player has picked an invalid hand' do
      it 'Should return false if invalid hand' do
        rps.game_options('1')
        result = rps.send(:valid_hand?, 'e')
        expect(result).to be_falsey
      end
    end
  end

  describe '#tie?' do
    context 'Both hands picked are the same' do
      it 'Should return true when both hands are the same' do
        player = Player.new('player')
        cpu = Player.new('CPU')
        player.current_choice = 'rock'
        cpu.current_choice = player.current_choice
        result = rps.send(:tie?, player, cpu)
        expect(result).to be_truthy
      end
      it 'Should return false when both hands are not the same' do
        player = Player.new('player')
        cpu = Player.new('CPU')
        player.current_choice = 'rock'
        cpu.current_choice = 'paper'
        result = rps.send(:tie?, player, cpu)
        expect(result).to be_falsey
      end
    end
  end

  describe '#rock_win?' do
    context 'Checks if the left player has won' do
      it "Should return true when right player has 'scissors'" do
        result = rps.send(:rock_win?, 'scissors')
        expect(result).to be_truthy
      end
      it "Should return false when right player has 'paper'" do
        result = rps.send(:rock_win?, 'paper')
        expect(result).to be_falsey
      end
    end
  end

  describe '#paper_win?' do
    context 'Checks if the left player has won' do
      it "Should return true when right player has 'rock'" do
        result = rps.send(:paper_win?, 'rock')
        expect(result).to be_truthy
      end
      it "Should return false when right player has 'scissors'" do
        result = rps.send(:paper_win?, 'scissors')
        expect(result).to be_falsey
      end
    end
  end

  describe '#scissors_win?' do
    context 'Checks if the left player has won' do
      it "Should return true when right player has 'paper'" do
        result = rps.send(:scissors_win?, 'paper')
        expect(result).to be_truthy
      end
      it "Should return false when right player has 'rock'" do
        result = rps.send(:scissors_win?, 'rock')
        expect(result).to be_falsey
      end
    end
  end

  describe '#play_again?' do
    context 'Checks if player wants to play again' do
      it "Should return true if player enters 'y'" do
        result = rps.play_again?('y')
        expect(result).to be_truthy
      end
      it 'Should return false if player enter any other key' do
        result = rps.play_again?('n')
        expect(result).to be_falsey
      end
    end
  end
end
