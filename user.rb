class User   
  attr_accessor :hand, :bank

  def initialize 
    @hand = Hand.new
    @bank = 100 
  end

  def take_card(deck)
    @hand.cards << deck.all_cards[0]  
    deck.all_cards.delete_at(0) 
    if @hand.cards.last.value =~ /[2, 3, 4, 5, 6, 7, 8, 9, 10]/
      @hand.points += @hand.cards.last.value.to_i
    elsif @hand.cards.last.value =~ /[J, Q, K]/
      @hand.points += 10
    elsif @hand.cards.last.value =~ /[A]/
      if @hand.points <= 10 
        @hand.points +=11 
      else 
        @hand.points += 1
      end    
    end 
  end   

  def first_move(deck)
    @bank -=10
    take_card(deck)
    take_card(deck)
  end  

  def second_move(deck) 
    take_card(deck)
  end         
end      