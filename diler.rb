require_relative 'User'
class Diler < User 

  def initialize(deck) 
    @@bank_of_diler ||=100 
    super
  end  

  def self.bank
    @@bank_of_diler 
  end

  def first_move 
    @@bank_of_diler -= 10
    super
  end 

  def second_move
    if @hand.points < 17
      super
    end       
  end

  def count_of_diler_cards
    @hand.cards.size 
  end   
end 