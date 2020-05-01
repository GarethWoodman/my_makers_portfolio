require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  #configure(:development) { set :session_secret, 'set' }
  #enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game =  Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/attack' do
    @game = Game.instance
    @game.attack(@game.opposing_player)
    @game.switch_turns
    redirect '/end_game' if @game.player_lost?
    redirect '/play'
  end

  get '/end_game' do
    @game = Game.instance
    erb :end_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
