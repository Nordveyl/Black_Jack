class Hand
  attr_reader :points, :cards 

  def initialize(deck)  
    @cards =[]
    @points = 0 
    @deck = deck 
  end 

  def take_card 
    card = Card.new(@deck.values[Random.rand(0..12)], @deck.suits[Random.rand(0..3)])
    @cards << card 
    if card.value =~ /[2, 3, 4, 5, 6, 7, 8, 9, 10]/
      @points += card.value.to_i
    elsif card.value =~ /[J, Q, K]/
      @points += 10
    elsif card.value =~ /[A]/
      if @points <= 10 
        @points +=11 
      else 
        @points += 1
      end    
    end 
  end                 
end 