pets = {:dog => {:name => "Chance", :weight => "45 pounds"},
        :cat => {:name => "Sassy", :weight => "15 pounds"}
       }

# 1. what is pets.count
2
# 2. what is pets.keys
[:dog, :cat]
# 3. what is pets.values
[{:name => "Chance", :weight => "45 pounds"}, {:name => "Sassy", :weight => "15 pounds"}]
# 4. how can I access the element "15 pounds"
pets[:cat][:weight]
# 5. how can I add :age => 3 to the value of the key :dog
pets[:dog][:age] = 3
require 'pry'; binding.pry