require_relative 'ace'
class Player 
  attr_accessor :cards_of_player, :points_of_player
  include Ace
  def initialize 
    @cards_of_player = []
    @points_of_player = 0 
    @@bank_of_player ||=100
  end  
  def self.bank_of_player
    @@bank_of_player 
  end   

  def take_card_player(cards)
    @cards_of_player << cards.take_card 
    @points_of_player += cards.all_cards.values_at(@cards_of_player.last)[0] 
  end   


  def first_move_of_player(cards)
    @@bank_of_player -= 10
    take_card_player(cards)
    take_card_player(cards)
    points_for_ace(self)
  end  

  def second_move_of_player(cards) 
    take_card_player(cards)
    points_for_ace(self)
  end           
end 