class Potluck
  attr_reader :dishes, :date

  def initialize(date)
    @date = date
    @dishes = []
  end
  
  def add_dish(meal)
    @dishes << meal
  end

  def get_all_from_category(category)
    dishes.select {|dish| dish.category == category}
  end
 
  def menu
    menu = Hash.new 
    
    category = dishes.map {|dish| dish.category}.uniq #cat in array
    dishes.each do |dish|
    menu[dish.category] = dishes.map {|data| dish.name}.sort
    end
    menu
  end
end