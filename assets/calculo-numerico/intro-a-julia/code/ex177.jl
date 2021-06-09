# This file was generated, do not modify it. # hide
function maior_pot(x)
    p = 1
    while p <= x
        p = 2p
    end
    p = div(p, 2)
    return p
end