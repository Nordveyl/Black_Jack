require_relative 'game_table'

class Interface 
  attr_reader :game_table
 
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
  
  def game_menu_1 
    @game_table = GameTable.new
    if Player.class_variable_get(:@@bank_of_player) == 0
      puts 'У Вас нет денег'
      exit 
    elsif Diler.class_variable_get(:@@bank_of_diler) == 0
      puts 'У Дилера нет денег'
      exit 
    end   
    game_table.first_move
    puts "\nВаш банк: #{Player.bank_of_player}"
    game_table.show_secret_cards_diler
    game_table.show_cards_and_points_player 
    puts " 1 Пропустить\n 2 Добавить карту\n 3 Открыть карты"
    point = gets.chomp.to_i
    if point == 1 
      game_table.diler.second_move_of_diler(game_table.cards)
      game_menu_2 
    elsif point == 2 
      game_table.player.second_move_of_player(game_table.cards)
      game_table.diler.second_move_of_diler(game_table.cards)
      end_of_game      
    elsif point == 3 
      end_of_game      
    end 
  end

  def game_menu_2
    game_table.show_secret_cards_diler
    puts "1 Добавить карту\n 2 Открыть карты"
    point = gets.chomp.to_i 
    if point == 1
      game_table.player.second_move_of_player(game_table.cards)
      end_of_game  
    elsif point == 2 
      end_of_game        
    end
  end 

  def end_of_game 
    game_table.show_all_cards_and_points
    game_table.show_who_win
    start_menu
  end                  
end