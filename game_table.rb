require_relative 'cards'
require_relative 'player'
require_relative 'diler'

class GameTable
  attr_reader :cards, :player, :diler
  
  def initialize 
    @cards = Cards.new 
    @player = Player.new 
    @diler = Diler.new 
  end 

  def player_win?
    if @player.points_of_player <= 21 
      if @player.points_of_player > @diler.points_of_diler || @diler.points_of_diler > 21
        result =  true
      end 
    else 
      result = false 
    end    
    result
  end 

  def diler_win? 
    if @diler.points_of_diler <= 21 
      if @player.points_of_player < @diler.points_of_diler || @player.points_of_player > 21
        result = true 
      end       
    else 
      result = false 
    end      
    result
  end 

  def first_move 
    @player.first_move_of_player(@cards)
    @diler.first_move_of_diler(@cards)
  end   

  def who_win? 
    cuurent_bank_diler = Diler.class_variable_get(:@@bank_of_diler)
    cuurent_bank_player = Player.class_variable_get(:@@bank_of_player)
    if @player.points_of_player > 21 && @diler.points_of_diler > 21 || @diler.points_of_diler == @player.points_of_player 
      puts 'Ничья'
      Diler.class_variable_set(:@@bank_of_diler, cuurent_bank_diler +=10)
      Player.class_variable_set(:@@bank_of_player, cuurent_bank_player +=10)
    elsif self.player_win?
      puts 'Вы выиграли'
      Player.class_variable_set(:@@bank_of_player, cuurent_bank_player +=20)
    elsif self.diler_win? 
      puts 'Дилер выиграл'
      Diler.class_variable_set(:@@bank_of_diler, cuurent_bank_diler +=20)
    end 
  end 

  def show_cards_and_points_player 
    puts "Ваши карты: #{@player.cards_of_player} и очки #{@player.points_of_player}" 
  end 

  def show_cards_and_points_diler
    puts "Карты Дилера: #{@diler.cards_of_diler} и очки #{@diler.points_of_diler}"
  end 
  
  def show_all_cards_and_points
    self.show_cards_and_points_player
    self.show_cards_and_points_diler 
  end  

  def show_secret_cards_diler 
    puts "Карты Дилера: #{'*'*diler.count_of_diler_cards}"
  end      
end 