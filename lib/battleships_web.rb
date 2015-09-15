require 'sinatra/base'
require_relative 'board'
require_relative 'cell'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  get '/new_board' do
    @board = Board.new(Cell).grid
    erb :result
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
