# This file was generated, do not modify it. # hide
function logaritmo2()
    ln2 = 1.0 / 2.0
    k = 2
    r = 1 / 4
    while ln2 + r /k != ln2
        ln2 += r / k
        k += 1
        r = r / 2
        if k > 1_000_000
            break
        end
    end
    println("k = $k")
    return ln2
end

logaritmo2() - log(2)