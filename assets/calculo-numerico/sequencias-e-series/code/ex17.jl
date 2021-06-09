# This file was generated, do not modify it. # hide
function fibon(n::Int)
    if n ≤ 0 #\le
        return 0
    elseif n == 1 || n == 2
        return 1
    end
    F1, F2, k = 1, 1, 2
    while k < n
        F3 = F1 + F2
        F1, F2 = F2, F3
        #F1, F2 = F2, F1 + F2
        k += 1
    end
    return F2
end

for n = 1:20
    println("F_$n = $(fibon(n))")
end