# ===============================
# Arithmetic operators
# (+, -, *, /, \, ^)
# ===============================

a = 10 + 5      # addition
b = 10 - 3      # subtraction
c = 4 * 6       # multiplication
d = 10 / 2      # right division
e = 10 \ 2      # left division
f = 2 ^ 3       # exponentiation

println(a, ", ", b, ", ", c, ", ", d, ", ", e, ", ", f)


# ===============================
# Relational operators
# (==, !=, <, >, <=, >=)
# Result is always Bool
# ===============================

println(5 == 5)   # true
println(5 != 3)   # true
println(2 < 4)    # true
println(7 > 10)   # false
println(3 <= 3)   # true
println(9 >= 2)   # true


# ===============================
# Logical operators
# (!, &&, ||)
# ===============================

println(!true)          # negation
println(true && false)  # logical AND
println(true || false)  # logical OR


# ===============================
# Dot operator (element-wise)
# Applies operator to each element of an array
# ===============================

fib = [1, 1, 2, 3, 5]

# Squaring each element using a loop
for i in 1:length(fib)
    fib[i] ^= 2    # element = element^2
end
println(fib)

# Same result using dot operator (element-wise)
fib2 = [1, 1, 2, 3, 5]
fib2 .= fib2 .^ 2   # element-wise power and assignment
println(fib2) 
