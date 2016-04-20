1.upto(50).each do |n|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, vegetarian: false, vegan: false, gluten_free: false, favorite_food: "Pizza")
  puts "Created user#{n} for realz"
end

1.upto(30).each do |n|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, vegetarian: true, vegan: false, gluten_free: false, favorite_food: "Mexican")
  puts "Created user#{n} for fakez"
end

1.upto(20).each do |n|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, vegetarian: false, vegan: true, gluten_free: false, favorite_food: "Salad")
  puts "Created user#{n} for realzies"
end
