require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'ship'
require_relative 'water'
require_relative 'player'
require_relative 'place_ship'

class BattleshipsWeb < Sinatra::Base
  include PlaceShip

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  $player = Player.new

  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    $player.name = params[:name]
    erb :new_game
  end

  get '/play_game' do
    $player.board = Board.new(Cell) if $player.board == nil
    @board = $player.board
    @name = $player.name
    self.place_ship("aircraft_carrier", "ac_orientation")
    self.place_ship("battleship", "bs_orientation")
    self.place_ship("submarine", "sb_orientation")
    self.place_ship("destroyer", "ds_orientation")
    self.place_ship("patrol_boat", "pb_orientation")
    @battleship = session[:battleship]
    @aircraft_carrier = session[:aircraft_carrier]
    @submarine = session[:submarine]
    @destroyer = session[:destroyer]
    @patrol_boat = session[:patrol_boat]
    erb :play_game
  end

  get '/new_board' do
    # @board = Board.new(Cell)
    # session[:board] = @board
    # erb :result
    # erb :new_board
  end

  get '/place' do
    # session[:ship] = Ship.destroyer
    # board = session[:board]
    # session[:board].place(session[:ship], :D4)
    # @board = session[:board].display_board
    # erb :result
  end

  get '/play' do
    # @board = session[:board].display_board
    # @fire = params[:fire]
    # @fire = @fire.to_sym if @fire != nil
    # session[:board].shoot_at(@fire) if @fire != nil
    # @result = session[:board].display_board
    # erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
