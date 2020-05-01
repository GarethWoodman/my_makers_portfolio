class Game
  attr_reader :player_1, :player_2, :current_turn, :winner, :loser

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [@player_1, @player_2]
    @current_turn = @player_1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def attack(player)
    player.recieve_damage
  end

  def switch_turns
   @current_turn == @player_2 ? @current_turn = @player_1 :
                                @current_turn = @player_2
 end

 def opposing_player
   @current_turn == @player_1 ? @player_2 : @player_1
 end

 def player_lost?
   @players.each do |player|
     @loser = player if player.hitpoints == 0
   end

   assign_winner_and_loser if @loser

   !@loser.nil?
 end

 private
 def assign_winner_and_loser
   @loser == @player_1 ? @winner = @player_2 : @winner = @player_1
 end
end
