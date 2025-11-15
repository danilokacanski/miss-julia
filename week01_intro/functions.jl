# ===============================
# Basic function definition
# ===============================

function zbir(x, y)
    x + y          # last expression is returned
end

println(zbir(2, 3))


# ===============================
# Short function syntax
# ===============================

zbir2(x, y) = x + y
println(zbir2(4, 5))


# ===============================
# Using return
# ===============================

function g(a, b)
    return a * b   # execution stops here
    a + b          # not executed
end

println(g(3, 4))


# ===============================
# Multiple return values (tuple)
# ===============================

function f_tuple(a, b)
    return a * b, a + b
end

t = f_tuple(2, 3)
println(t[2])            # (6, 5)
println(typeof(t))    # Tuple


# ===============================
# Returning a vector instead of a tuple
# ===============================

function f_vector(a, b)
    return [a * b, a + b]
end

v = f_vector(2, 3)
println(v)            # [6, 5]
println(typeof(v))    # Vector


# ===============================
# Multiple outputs without return
# ===============================

function f_multi(x, y)
    a = x + y
    b = x - y
    c = x * y
    d = x / y
    a, b, c, d       # returned as tuple
end

println(f_multi(10, 5))

# ===============================
# Optional parameters (default values)
# ===============================

function f_opt(x, y, z = 0)
    println(x)
    println(y)
    println(z)       # default is 0 unless overridden
end

f_opt(5, 10)          # z = 0
f_opt(5, 10, 15)      # z = 15


# ===============================
# Keyword parameters
# ===============================

function f_kw(x, y; a = 0, b = 0, c = 0, d = 0)
    println(x)
    println(y)
    println(a)
    println(b)
    println(c)
    println(d)
end

f_kw(5, 10, c = 15)           # only c changed
f_kw(5, 10, c = 15, a = 3)    # order does not matter
f_kw(b = 8, 5, c = 4, 10)     # mixed order also valid


# ===============================
# Combining optional + keyword parameters
# ===============================

function f_mix(x, y, z = 0; a = 0, b = 0, c = 0, d = 0)
    println(x)
    println(y)
    println(z)
    println(a)
    println(b)
    println(c)
    println(d)
end

f_mix(1, 2) 
f_mix(1, 2, 3, c = 10)


# ===============================
# Anonymous functions
# ===============================

# Anonymous function defined with function ... end
anon1 = function (x, y)
    x + y
end

println(anon1(2, 3))


# Short anonymous function syntax
anon2 = (x, y) -> x + y
println(anon2(4, 5))


# Passing an anonymous function as an argument
function apply_func(g, x, y)
    g(x, y)
end

println(apply_func((x, y) -> x + y, 2, 3))