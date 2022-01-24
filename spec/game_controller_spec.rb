# frozen_string_literal: true

require_relative '../lib/controller/game_controller'
require_relative '../lib/model/player'
require_relative '../lib/view/game_view'

RSpec.describe GameController do
  let(:controller) { GameController.new }

  describe '#initialize' do
    it 'Initialize to create an instance of view' do
      expect(controller
        .instance_variable_get(:@view))
        .to be_a GameView
    end
  end
end
