# This file was generated, do not modify it. # hide
function collatz(a::Int; a_bound = 10^17, n_bound = 1_000_000) # O mesmo que começar com x e atribuir x à a.
    n = 1
    if a <= 0
        return 0
    end
    while a > 1
        print("$a ")
        if a % 2 == 0
            a = div(a, 2)
        else
            a = 3a + 1
        end
        n += 1
        if a > a_bound
            return -1
        elseif n > n_bound
            return -2
        end
    end
    return n
end