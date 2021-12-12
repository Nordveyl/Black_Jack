class Deck  
  attr_accessor :values, :suits

  VALUES = ['2','3','4','5','6','7','8','9','10',"J","Q","K","A"]

  SUITS = ["<3","+","<>","^"]

  def initialize 
    @values = VALUES 
    @suits= SUITS 
  end  
end 