# This file was generated, do not modify it. # hide
function ehprimo(n::Int)
    if n == 1
        return false
    end
    for k = 2:n-1
        if n % k == 0
            return false
        end
    end
    return true
end