require_relative 'game_table'

class Interface 
  attr_reader :game_table
  
  def initialize 
    @game_table = GameTable.new
  end 
    
  def start_menu 
    puts 'Игра Black Jack!'
    puts "\n1 Начать игру\n0 Выйти"  
    point = gets.chomp.to_i 
    if point == 1 
      game_menu_1
    elsif point == 0 
      exit 
    end   
  end 
  
  private 

  def game_menu_1 
    start_game
    puts " 1 Пропустить\n 2 Добавить карту\n 3 Открыть карты"
    point = gets.chomp.to_i
    if point == 1 
      skip
    elsif point == 2 
      add_card_on_first_move    
    elsif point == 3 
      end_of_game      
    end 
  end

  def game_menu_2
    show_secret_cards_diler
    puts "1 Добавить карту\n 2 Открыть карты"
    point = gets.chomp.to_i 
    if point == 1
      add_card_on_second_move  
    elsif point == 2 
      end_of_game        
    end
  end 

  def add_card_on_second_move
    @game_table.player.second_move(@game_table.deck)
    end_of_game 
  end 
    
  def add_card_on_first_move 
    @game_table.player.second_move(@game_table.deck)
    @game_table.diler.second_move(@game_table.deck)
    end_of_game
  end 
      
  def skip 
    @game_table.diler.second_move(@game_table.deck)
    game_menu_2 
  end 
    
  def start_game 
    validate_bank 
    @game_table.first_move
    puts "\nВаш банк: #{@game_table.player.bank}"
    show_secret_cards_diler
    show_cards_and_points_player
  end   

  def end_of_game 
    show_all_cards_and_points
    puts @game_table.who_win
    @game_table.end 
    start_menu
  end 

  def validate_bank 
    if @game_table.player.bank == 0
      puts 'У Вас нет денег'
    elsif @game_table.diler.bank == 0
      puts 'У Дилера нет денег'
    end 
  end 

  def show_cards_and_points_player 
    puts "Ваши карты: #{@game_table.player.hand.cards} и очки #{@game_table.player.hand.points}" 
  end 

  def show_cards_and_points_diler
    puts "Карты Дилера: #{@game_table.diler.hand.cards} и очки #{@game_table.diler.hand.points}"
  end 
  
  def show_all_cards_and_points
    show_cards_and_points_player
    show_cards_and_points_diler 
  end  

  def show_secret_cards_diler 
    puts "Карты Дилера: #{'*'*@game_table.diler.count_of_diler_cards}"
  end                   
end   