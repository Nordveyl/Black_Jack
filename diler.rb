require_relative 'ace'
class Diler 
  include Ace
  attr_accessor :cards_of_diler, :points_of_diler
  
  def initialize 
    @cards_of_diler = []
    @points_of_diler = 0 
    @@bank_of_diler ||=100
  end  

  def self.bank_of_diler
    @@bank_of_diler 
  end   

  def take_card_diler(cards)
    @cards_of_diler << cards.take_card 
    @points_of_diler += cards.all_cards.values_at(@cards_of_diler.last)[0] 
  end   


  def first_move_of_diler(cards)
    @@bank_of_diler -= 10
    take_card_diler(cards)
    take_card_diler(cards)
    points_for_ace(self)
  end  

  def second_move_of_diler(cards) 
    if @points_of_diler < 17
      take_card_diler(cards)
      points_for_ace(self)
    end       
  end

  def count_of_diler_cards
    @cards_of_diler.size 
  end   
end 