use context dcic2024

# include plot

# eps = 0.001
# fun d-dx(f):
#   doc: "Approximate the derivative of f"
#   lam(x): (f(x + eps) - f(x)) / eps end
# where:
#   fun my-square(x): x * x end
#   fun around(delta, target):
#     lam(actual): num-abs(actual - target) < delta end
#   end

#   dsquare = d-dx(my-square)

#   dsquare(5) satisfies around(0.1, 10)
#   dsquare(10) satisfies around(0.1, 20)
# end


# # scatter-plot here expects a **Table** with columns x and y
# t = table: x :: Number, y :: Number
#   row: 1, 3
#   row: 2, 1
#   row: 3, 4
#   row: 4, 1
#   row: 5, 5
# end

# display-scatter("My scatter plot", t)

# snackfacts.arr
# Tables + Plots assignment template
# ------------------------------------------------------------
# Instructions:
# 1) Put this file in the same folder as `snackfacts.csv`.
# 2) Work through the TODOs in order.
# 3) Run often! Use the interactions window to inspect values.

# ------------------------------------------------------------
# SECTION 0: Import data (choose ONE source)
# ------------------------------------------------------------
include table 
include image
include csv

snacks = load-table:
  name :: String,
  category :: String,
  is_healthy :: Boolean,
  calories :: Number,
  sugar_g :: Number,
  sodium_mg :: Number
  source: csv-table-url(
    "https://raw.githubusercontent.com/vahabsamandi/Fundies-start/main/snackfacts.csv",
    default-options)
end


# Quick sanity checks (uncomment to peek)
snacks.length()
snacks.row-n(0)
snacks.get-column("category")

# ------------------------------------------------------------
# SECTION 1: Warm-up — inspecting & filtering
# ------------------------------------------------------------

# TODO 1.1: Grab the 0th row and read two fields (run in interactions or assign to names)
r0 = snacks.row-n(0)
# r0["name"]
# r0["calories"]

# TODO 1.2: Write a predicate to identify fruits and build a fruit-only table
fun is_fruit(r): r["category"] == "Fruit" end
fruit = filter-with(snacks, is_fruit)

# TODO 1.3: Healthy AND <= 120 calories
fun is_healthy_lowcal(r): (r["is_healthy"] and r["calories"]) <= 120 end
healthy_lowcal = filter-with(snacks, is_healthy_lowcal)

# ------------------------------------------------------------
# SECTION 2: Sorting, selecting, adding columns/rows
# ------------------------------------------------------------

# TODO 2.1: Sort by sodium ascending
sorted_sodium = sort-by(snacks, "sodium_mg", true)

# TODO 2.2: Keep only a few columns (projection)
mini = select-columns(snacks, [list: "name", "category", "calories"])

# TODO 2.3: Add a computed column "cal_per_g" (assume ~30g per serving for this dataset)
fun cals_per_gram(r): r["calories"] / 30 end
snacks2 = build-column(snacks, "cal_per_g", cals_per_gram)

# TODO 2.4: Add one new snack row (choose reasonable values)
rc-table = table:
  name :: String, category :: String, is_healthy :: Boolean,
  calories :: Number, sugar_g :: Number, sodium_mg :: Number
  row: "Rice Cakes", "Chips", true, 45, 0, 15
end

# ...grab the row value...
new_row = rc-table.row-n(0)
snacks3 = add-row(snacks2, new_row)

# ------------------------------------------------------------
# SECTION 3: Visualisation — scatter, hist, bars, pie
# ------------------------------------------------------------

# TODO 3.1: Scatter plot — Sugar vs Calories
# scatter-plot(snacks, "sugar_g", "calories")

# TODO 3.2: Regression line — quick sense of correlation
# lr-plot(snacks, "sugar_g", "calories")

# TODO 3.3: Histogram — Sodium distribution, bin width 50
# histogram(snacks, "sodium_mg", 50)

# TODO 3.4: Bar chart — Calories by item (labels are names)
# bar-chart(select-columns(snacks, ["name", "calories"]), "name", "calories")

# TODO 3.5: Pie chart — share of items by category
by_cat = count(snacks, "category")
# pie-chart(by_cat, "category", "count")

# ------------------------------------------------------------
# SECTION 4: Summaries & simple stats
# ------------------------------------------------------------

# TODO 4.1: Compute and print some descriptive stats
mean_cal = mean(snacks, "calories")
median_cal = median(snacks, "calories")
stdev_cal = stdev(snacks, "calories")
# mean_cal
# median_cal
# stdev_cal

# TODO 4.2: Per-category mean calories table (sketch)
# cat_summary = table:
#   Category :: String,
#   Mean_Calories :: Number
#   row: "Chips",   <compute-mean-here>
#   row: "Fruit",   <...>
#   row: "Nuts",    <...>
#   row: "Bars",    <...>
#   row: "Cookies", <...>
# end
# bar-chart(cat_summary, "Category", "Mean_Calories")

# ------------------------------------------------------------
# SECTION 5: Challenges (A & B only)
# ------------------------------------------------------------

# CHALLENGE A: Derived boolean label "low_sugar" (< 5g)
fun low_sugar_pred(r): r["sugar_g"] < 5 end
fun low_sugar_value(r): low_sugar_pred(r) end
snacks4 = build-column(snacks3, "low_sugar", low_sugar_value)
# freq-bar-chart(snacks4, "low_sugar")

# CHALLENGE B: Encode boolean to numeric for plotting (0/1)
fun healthy01(r):
  if r["is_healthy"]:
    1
  else:
    0
  end
end
snacks5 = build-column(snacks4, "healthy01", healthy01)
# scatter-plot(snacks5, "calories", "healthy01")
# Discussion prompt (in comments): Why are points at y=0 and y=1? What does this say about linear correlation?

# ------------------------------------------------------------
# (Optional) SECTION 6: Exporting results
# ------------------------------------------------------------
# save-table(snacks5, "snackfacts_with_flags.csv")

# End of file
