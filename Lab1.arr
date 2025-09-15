include image

# 1
# T-Shirt Shop (arithmetic)

# a. Calculating Cost
tshirtprice = 12
setup-fee   = 3
# 5 identical T-shirts for one design
total-5 = (tshirt-price * 5) + setup-fee
# 7 identical T-shirts for one design
total-7 = (tshirt-price * 7) + setup-fee
total-5 
total-7

# b. Rectangular Poster
width  = 420
height = 594
rate   = 0.10

perim = 2 * (width + height)
cost  = perim * rate

perim
cost

#----------------------------------------------

# 2
# String Surprises

# Correct
tagline = "Designs for everyone!"
print(tagline)

# Omit a quote -> syntax error
# tagline-bad = "Designs for everyone!

# Fix and print
print("Designs for everyone!")

# Adding strings concatenates:
"red" + "blue"  # -> "redblue"

# Mixing number and string -> type error
# 1 + "blue"
#--------------------------------------------

# 3
# Make a Traffic Light


# Body
body  = rectangle(40, 120, "solid", "black")

# Lights
r = circle(20, "solid", "red")
y = circle(20, "solid", "yellow")
g = circle(20, "solid", "green")

# Stack the lights
lights = above(r, above(y, g))

# Option A: overlay lights centered on body

"Option A:"
traffic = overlay-align("center", "top", lights, body)
frame(traffic)

pole = rectangle(5, 80, "solid", "black")

traffic_with_poleA = below(pole, traffic)
traffic_with_poleA

# Option B: overlay-xy

"Option B:"

image1 = overlay-xy(r, 0, 0, body)
image2 = overlay-xy(y, 0, -40, image1)
image3 = overlay-xy(g, 0, -80, image2)
image3
traffic_with_poleB = below(pole, image3)
traffic_with_poleB


#------------------------------------------

# 4 
# Broken Code Hunt (fix the errors)

# A rectangle with width 50 and height 20, solid black
# rectangle(width, height, mode, color)
good-rect = rectangle(50, 20, "solid", "black")

# circle(radius, mode, color) and mode must be a string
good-circ = circle(30, "solid", "red")
#------------------------------------------

# 5
# Flag 

above(above( rectangle(70, 20, "solid", "red"), overlay(circle(10, "solid", "blue"), rectangle(70, 20, "solid", "white"))), rectangle(70, 20, "solid", "red"))

# Shiled
diamond = rotate(45, square(140, "solid", "gray"))
badge   = overlay(radial-star(8, 28, 64, "solid", "dark-green"), diamond)
label   = overlay(text("Go!", 20, "black"), badge)
label









