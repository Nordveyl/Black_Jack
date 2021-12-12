class Deck  
  attr_accessor :all_cards

  VALUES = ['2','3','4','5','6','7','8','9','10',"J","Q","K","A"]

  SUITS = ["<3","+","<>","^"]

  def initialize 
    @all_cards = all_cards  
  end  

  def all_cards 
    i = 0
    cards = [] 
    loop do 
      VALUES.each {|x| cards << Card.new(x, SUITS[i]) } 
      i+=1
      break if i==4
    end 
    cards.shuffle
  end  
end 