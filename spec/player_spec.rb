# frozen_string_literal: true

require_relative '../lib/model/player'

RSpec.describe Player do
  let(:player) { Player.new('player') }
  let(:VALID_HANDS) { %w[rock paper scissors] }

  describe '#initialize' do
    it 'Should set current choice to be empty' do
      expect(player
        .instance_variable_get(:@current_choice))
        .to be_empty
    end
    it 'Should set name of player' do
      expect(player).to have_attributes(name: 'player')
    end
  end
  describe '#assign_hand' do
    it 'Should assign current choice as rock' do
      player.current_choice = 1
      player.assign_hand
      expect(player.current_choice).to eq 'rock'
    end
    it 'Should assign current choice as paper' do
      player.current_choice = 2
      player.assign_hand
      expect(player.current_choice).to eq 'paper'
    end
    it 'Should assign current choice as scissors' do
      player.current_choice = 3
      player.assign_hand
      expect(player.current_choice).to eq 'scissors'
    end
  end
  describe '#cpu' do
    it 'Should assign a random hand to the cpu' do
      player.cpu
      expect(player.current_choice).to be_kind_of String
    end
  end
end
