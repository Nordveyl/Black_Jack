class Diler 
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
    self.take_card_diler(cards)
    self.take_card_diler(cards)
    @cards_of_diler.each do |x| 
      if x =~ /[A]/
        if @points_of_diler <= 10
          @points_of_diler += 11 
        else 
          @points_of_diler += 1
        end 
      end     
    end
  end  

  def second_move_of_diler(cards) 
    if @points_of_diler < 17
      self.take_card_diler(cards)
      if @cards_of_diler.last =~ /[A]/
        if @points_of_diler <= 10
          @points_of_diler += 11 
        else 
          @points_of_diler += 1
        end 
      end 
    end       
  end

  def count_of_diler_cards
    @cards_of_diler.size 
  end   
end 