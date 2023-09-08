numbers = [[1, 2, 3], [4, 5, 6]]

# 1. what is numbers.count
2
# 2. what is numbers.first.count
3
# 3. how can I access the element 5
numbers[1][1]
# 4. how can I add [7,8,9] to the numbers array
numbers << [7,8,9]
numbers.insert(-1, [7,8,9])
# 5. What element does numbers[0] return?
[1,2,3]
require 'pry'; binding.pry