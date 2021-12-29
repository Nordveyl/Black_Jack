require_relative 'User'
class Diler < User 

  def initialize 
    super
  end  

  def second_move(deck)
    if @hand.points < 17
      super
    end       
  end

  def count_of_diler_cards
    @hand.cards.size 
  end   
end 