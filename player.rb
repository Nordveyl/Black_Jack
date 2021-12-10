class Player 
  attr_accessor :cards_of_player, :points_of_player
  
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
    self.take_card_player(cards)
    self.take_card_player(cards)
    @cards_of_player.each do |x| 
      if x =~ /[A]/
        if @points_of_player <= 10
          @points_of_player += 11 
        else 
          @points_of_player += 1
        end 
      end     
    end
  end  

  def second_move_of_player(cards) 
    self.take_card_player(cards)
    if @cards_of_player.last =~ /[A]/
      if @points_of_player <= 10
        @points_of_player += 11 
      else 
        @points_of_player += 1
      end 
    end 
  end

  def count_of_player_cards
    @cards_of_player.size 
  end           
end 