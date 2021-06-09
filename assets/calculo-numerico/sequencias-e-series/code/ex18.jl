# This file was generated, do not modify it. # hide
function fat_por_recursao(n::Int)
    if n < 0
        error("BLAH")
    end
    if n == 0
        return 1
    end
    return n * fat_por_recursao(n - 1)
end

fat_por_recursao(5)