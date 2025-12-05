# ===============================
# 7. Control Flow in Julia
# ===============================

# ====================================
# 7.1 If / elseif / else
# ====================================

t = 8

# simple if
if t > 7
    println("Value is greater than 7")
end

# if-else
if t < 5
    y = 0
else
    y = 1
end
println(y)

# if-elseif-else chain
if t < 5
    y = 0
elseif t < 10
    y = 1
elseif t < 15
    y = 2
else
    y = 3
end
println(y)

# ternary operator
y = t < 5 ? 0 : 1
println(y)


# ====================================
# 7.2 For loops
# ====================================

array = [1, 2, 3, 4, 5]

# sum using index-based loop
arr_sum = 0
for i in 1:length(array)
    arr_sum += array[i]   # 'global' needed in top-level code
end
println(arr_sum)

# sum using element-based loop
arr_sum = 0
for el in array
    arr_sum += el
end
println(arr_sum)

# array comprehensions (compact syntax)
a = [2^i for i in 0:10]
println(a)

b = [2^i for i in 0:10 if i % 2 == 0]
println(b)


# ====================================
# 7.3 While loops
# ====================================

# while loop inside a function (no global needed)
function example(level, target)
    n = 1
    while level - 1 / n >= target
        level -= 1 / n
        n += 1
        println(target, level, n)
    end
    return n
end

println(example(5, 3))


# Fibonacci sequence using while loop
function fibonacci(limit)
    f = [1, 1]
    n = 2
    while f[n] + f[n-1] < limit
        push!(f, f[n] + f[n-1])   # push! appends element to array
        n += 1
    end
    return f
end

println(fibonacci(50))