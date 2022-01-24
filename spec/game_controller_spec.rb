# frozen_string_literal: true

require_relative '../lib/controller/game_controller'
require_relative '../lib/model/player'
require_relative '../lib/view/game_view'
require 'pry-byebug'

RSpec.describe GameController do
  let(:rps) { GameController.new }

  describe '#initialize' do
    it 'Should initialize with an instance variable of GameView' do
      expect(rps
        .instance_variable_get(:@view))
        .to be_a GameView
    end
  end

  describe '#game_options' do
    context 'Player has selected option 1.Play against CPU' do
      it 'Should initialize an instance of Player(player)' do
        rps.game_options('1')
        # rps.send(:valid_hand?, 1)
        expect(rps
          .instance_variable_get(:@player))
          .to be_a Player
        # expect(rps
        #   .instance_variable_get(:@player))
        #   .to eq 'player'
      end
      it 'Should initialize an instance of Player(CPU)' do
        rps.game_options('1')
        expect(rps
          .instance_variable_get(:@cpu))
          .to be_a Player
      end
    end
  end
end
