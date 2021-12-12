require_relative 'card'
require_relative 'player'
require_relative 'diler'
require_relative 'user'
require_relative 'hand'
require_relative 'deck'
class GameTable
  attr_reader :cards, :player, :diler
  
  def initialize 
    @deck = Deck.new 
    @player = Player.new(@deck) 
    @diler = Diler.new(@deck)
  end 

  def first_move 
    @player.first_move
    @diler.first_move
  end   

  def who_win 
    cuurent_bank_diler = Diler.class_variable_get(:@@bank_of_diler)
    cuurent_bank_player = Player.class_variable_get(:@@bank_of_player)
    if @player.hand.points > 21 && @diler.hand.points > 21 || @diler.hand.points == @player.hand.points 
      result = 'Ничья'
      Diler.class_variable_set(:@@bank_of_diler, cuurent_bank_diler +=10)
      Player.class_variable_set(:@@bank_of_player, cuurent_bank_player +=10)
    elsif self.player_win?
      result = 'Вы выиграли'
      Player.class_variable_set(:@@bank_of_player, cuurent_bank_player +=20)
    elsif self.diler_win? 
      result = 'Дилер выиграл'
      Diler.class_variable_set(:@@bank_of_diler, cuurent_bank_diler +=20)
    end 
    result
  end 

  def validate_bank 
    if Player.class_variable_get(:@@bank_of_player) == 0
      puts 'У Вас нет денег'
      exit
    elsif Diler.class_variable_get(:@@bank_of_diler) == 0
      puts 'У Дилера нет денег'
      exit
    end 
  end 

  private 

  def player_win?
    if @player.hand.points <= 21 
      if @player.hand.points > @diler.hand.points || @diler.hand.points > 21
        result =  true
      end 
    else 
      result = false 
    end    
    result
  end 

  def diler_win? 
    if @diler.hand.points <= 21 
      if @player.hand.points < @diler.hand.points || @player.hand.points > 21
        result = true 
      end       
    else 
      result = false 
    end      
    result
  end       
end 