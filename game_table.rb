require_relative 'card'
require_relative 'player'
require_relative 'diler'
require_relative 'user'
require_relative 'hand'
require_relative 'deck'
class GameTable
  attr_reader :deck, :player, :diler

  def initialize 
    @deck = Deck.new 
    @player = Player.new 
    @diler = Diler.new
  end 

  def first_move
    @player.first_move(@deck)
    @diler.first_move(@deck)
  end  

  def who_win 
    if @player.hand.points > 21 && @diler.hand.points > 21 || @diler.hand.points == @player.hand.points 
      result = 'Ничья'
      @diler.bank +=10
      @player.bank += 10
    elsif self.player_win?
      result = 'Вы выиграли'
      @player.bank += 20
    elsif self.diler_win? 
      result = 'Дилер выиграл'
      @diler.bank +=20
    end 
    result
  end 

  def end 
    @player.hand.points = 0 
    @diler.hand.points = 0 
    @player.hand.cards = [] 
    @diler.hand.cards = [] 
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