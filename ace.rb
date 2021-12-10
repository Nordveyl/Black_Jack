module Ace 
  def points_for_ace(user)
    name_of_class = user.class.to_s.downcase 
    cards = user.instance_variable_get("@cards_of_#{name_of_class}".to_sym)
    points = user.instance_variable_get("@points_of_#{name_of_class}".to_sym) 
    if cards.size == 2
      cards.each do |x| 
        if x =~ /[A]/
          validate_of_ace(user, name_of_class, points)
        end     
      end
    elsif cards.size == 3
      cards.last =~ /[A]/
      validate_of_ace(user, name_of_class, points) 
    end  
  end

  def validate_of_ace(user, name_of_class, points)
    if points <= 10
      user.instance_variable_set("@points_of_#{name_of_class}".to_sym, points += 11)
    else 
      user.instance_variable_set("@points_of_#{name_of_class}".to_sym, points += 1)
    end 
  end  
end 