# This file was generated, do not modify it. # hide
function pi_atan()
    S = 1.0
    n = 1
    σ = -1
    t = σ/(2n+1)
    while S + t != S
        S += t
        σ = -σ
        n += 1
        t = σ/(2n+1)
        if n > 1_000_000_000
            break
        end
    end
    return 4S
end

pi_atan()