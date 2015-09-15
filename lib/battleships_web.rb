require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'water'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  get '/new_board' do
    @board = Board.new(Cell)
    session["board"] = @board
    # erb :result
    erb :new_board
  end

  get '/place' do
    # ship = Ship.destroyer
    board = session["board"]
    # board.place(ship, :D4)
    @board = board.display_board
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
