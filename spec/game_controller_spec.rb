# frozen_string_literal: true

require_relative '../lib/controller/game_controller'
require_relative '../lib/view/game_view'

RSpec.describe Gamecontroller, '#initialize' do
  it 'initialize to create an instance of view' do
    @view = GameView.new
    expect(@view.class).to eq GameView
  end
end
