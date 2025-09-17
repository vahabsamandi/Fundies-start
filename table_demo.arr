include tables
include csv

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/your-username/your-repo/main/small_recipes.csv")
end

recipes
