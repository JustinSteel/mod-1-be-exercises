require './lib/dish'

RSpec.describe 'Dish'
  
  describe 'Instance' do
    it 'checks if dish is an instance of the class Dish' do
    dish = Dish.new("Couscous Salad", :appetizer)

    expect(dish).to be_instance_of Dish
    end
  end

  describe 'Name' do
    it 'checks if it has a name' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish.name).to eq("Couscous Salad")
    end
  end

  describe 'Category' do
    it 'checks what category the dish is' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish.category).to eq(:appetizer)
    end
  end




#   pry(main)> require './lib/dish'
# #=> true

# pry(main)> dish = Dish.new("Couscous Salad", :appetizer)
# #=> #<Dish:0x00007f93fe9aa698...>

# pry(main)> dish.name
# #=> "Couscous Salad"

# pry(main)> dish.category
# #=> :appetizer
# ```



