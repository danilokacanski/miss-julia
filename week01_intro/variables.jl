# Variables store values under a chosen name
a = 5            # integer value
println(a)
println(typeof(a))   # check type

# A variable can later receive a value of another type
a = "tekst"      # now 'a' is a String
println(a)
println(typeof(a))

# Julia infers the type from the assigned value
x = 3.14         # Float64
y = true         # Bool
println(typeof(x))
println(typeof(y))

# Good naming: descriptive and readable
radius = 4
circle_perimeter = 2 * radius * pi   # 'pi' is predefined
println(circle_perimeter)

# Bad naming: unclear meaning
a1 = 2 * radius * pi    # not recommended

# Predefined special values
println(Inf)     # infinity
println(NaN)     # not-a-number
println(pi)      # constant π
println(1 + 2im) # imaginary unit

# Naming conventions:
# - variables: lowercase_with_underscores 