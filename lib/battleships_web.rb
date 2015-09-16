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
    @name = params[:name]
    @player = Player.new
    @player.name = params[:name]
    session[:player] = @player
    erb :new_game
  end

  get '/play_game' do
    @board = Board.new(Cell)
    session[:board] = @board
    @name = session[:name]
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
