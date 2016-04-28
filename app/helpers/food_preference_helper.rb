module FoodPreferenceHelper

  def help
    "Possible commands when using the /food-prefs slash command\n
    /food-prefs #add [food_name]     | will add food or dietary restriction to your preferences \n
    /food-prefs #delete [food_name]  | will remove food from your preferences \n
    /food-prefs #list                | will return list of your food preferences \n
    '#add' and '#delete' commands will only accept the first word after it"
  end
end
