class User   
  attr_accessor :hand

  def initialize(deck) 
    @hand = Hand.new(deck)
  end

  def first_move
    @hand.take_card
    @hand.take_card
  end  

  def second_move 
    @hand.take_card
  end         
end      