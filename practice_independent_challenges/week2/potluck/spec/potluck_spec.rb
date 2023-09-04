require './lib/dish'
require './lib/potluck'

RSpec.describe 'Potluck' do

  describe 'Instance' do
    it 'checks if potluck is instance of Potluck' do
      potluck = Potluck.new("7-13-18")

      expect(potluck).to be_instance_of Potluck 
    end
  end

  describe 'Date' do
    it 'checks for date of the potluck' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.date).to eq("7-13-18")
    end
  end

  describe 'Dishes' do
    it 'looks at the dishes available' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.dishes).to eq([])
    end
  end

  describe 'dishes Instance of Dish' do
    it 'checks if dishes are instance of Dish' do
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      expect(couscous_salad).to be_instance_of Dish
      expect(cocktail_meatballs).to be_instance_of Dish
    end
  end

  describe 'Add Dishes' do
    it 'Adds dishes to the dishes array' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end
  end

  describe 'Count dishes' do
    it 'counts the dishes you have' do
      potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes.count).to eq(2)
    end
  end

  describe 'Sort by Category' do
    it 'sorts dishes by category' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
      
    end
  end

  describe 'Menu' do
    it 'alphabetize the menu and have all dishes' do 
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      ocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]})
    end
  end

end

# ## Iteration 4

# Use TDD to update your `Potluck` class so that it responds to the following interaction pattern:

# **Note** for the the `menu` method, dishes are sorted alphabetically.

# ```ruby
# pry(main)> require './lib/dish'
# #=> true

# pry(main)> require './lib/potluck'
# #=> true

# pry(main)> potluck = Potluck.new("7-13-18")
# #=> #<Potluck:0x00007f9422838908...>

# pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
# #=> #<Dish:0x00007f942191e9b8...

# pry(main)> summer_pizza = Dish.new("Summer Pizza", :appetizer)
# #=> #<Dish:0x00007f9421d26880...>

# pry(main)> roast_pork = Dish.new("Roast Pork", :entre)
# #=> #<Dish:0x00007f9421d04870...>

# pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
# #=> #<Dish:0x00007f9421ce6e88...>

# pry(main)> candy_salad = Dish.new("Candy Salad", :dessert)
# #=> #<Dish:0x00007f9421cb60f8...>

# pry(main)> bean_dip = Dish.new("Bean Dip", :appetizer)
# #=> #<Dish:0x00007fa115885500...>

# pry(main)> potluck.add_dish(couscous_salad)
# #=> [#<Dish:0x00007f942191e9b8...]

# pry(main)> potluck.add_dish(summer_pizza)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>]

# pry(main)> potluck.add_dish(roast_pork)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>]

# pry(main)> potluck.add_dish(cocktail_meatballs)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>]

# pry(main)> potluck.add_dish(candy_salad)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>]

# pry(main)> potluck.add_dish(bean_dip)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>, #<Dish:0x00007f9421dAA680...>]

# pry(main)> potluck.menu
#  => {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]}

# pry(main)> potluck.ratio(:appetizer)
# #=> 50.0
# ```








## Iteration 3

# Use TDD to update your `Potluck` class so that it responds to the following interaction pattern:

# ```ruby
# pry(main)> require './lib/dish'
# #=> true

# pry(main)> require './lib/potluck'
# #=> true

# pry(main)> potluck = Potluck.new("7-13-18")
# #=> #<Potluck:0x00007f9422838908...>

# pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
# #=> #<Dish:0x00007f942191e9b8...

# pry(main)> summer_pizza = Dish.new("Summer Pizza", :appetizer)
# #=> #<Dish:0x00007f9421d26880...>

# pry(main)> roast_pork = Dish.new("Roast Pork", :entre)
# #=> #<Dish:0x00007f9421d04870...>

# pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
# #=> #<Dish:0x00007f9421ce6e88...>

# pry(main)> candy_salad = Dish.new("Candy Salad", :dessert)
# #=> #<Dish:0x00007f9421cb60f8...>

# pry(main)> potluck.add_dish(couscous_salad)
# #=> [#<Dish:0x00007f942191e9b8...]

# pry(main)> potluck.add_dish(summer_pizza)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>]

# pry(main)> potluck.add_dish(roast_pork)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>]

# pry(main)> potluck.add_dish(cocktail_meatballs)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>]

# pry(main)> potluck.add_dish(candy_salad)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>, #<Dish:0x00007f9421e26800...>, #<Dish:0x00007f9421dAA770...>, #<Dish:0x00007f9421dAA610...>]

# pry(main)> potluck.get_all_from_category(:appetizer)
# #=> [#<Dish:0x00007f942191e9b8...>, #<Dish:0x00007f9421d26880...>

# pry(main)> potluck.get_all_from_category(:appetizer).first
# #=> #<Dish:0x00007f942191e9b8...>

# pry(main)> potluck.get_all_from_category(:appetizer).first.name
# => "Couscous Salad"
# ```


# pry(main)> require './lib/dish'
# #=> true

# pry(main)> require './lib/potluck'
# #=> true

# pry(main)> potluck = Potluck.new("7-13-18")
# #=> #<Potluck:0x00007fccc4abe940...>

# pry(main)> potluck.date
# #=> "7-13-18"

# pry(main)> potluck.dishes
# #=> []

# pry(main)> couscous_salad = Dish.new("Couscous Salad", :appetizer)
# #=> #<Dish:0x00007fccc4249940...>

# pry(main)> cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
# #=> #<Dish:0x00007fccc499ceb8...>

# pry(main)> potluck.add_dish(couscous_salad)

# pry(main)> potluck.add_dish(cocktail_meatballs)

# pry(main)> potluck.dishes
# #=> [#<Dish:0x00007fccc4249940...>, #<Dish:0x00007fccc499ceb8...>]

# pry(main)> potluck.dishes.length
# #=> 2
# ```