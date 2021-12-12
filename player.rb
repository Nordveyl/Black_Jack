require_relative 'User'
class Player < User
  
  def initialize(deck) 
    @@bank_of_player ||=100
    super
  end 

  def first_move 
    @@bank_of_player -= 10
    super
  end 
    
  def self.bank
    @@bank_of_player 
  end  
end 