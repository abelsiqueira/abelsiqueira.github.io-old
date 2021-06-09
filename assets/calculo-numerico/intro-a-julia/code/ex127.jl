# This file was generated, do not modify it. # hide
function rayleigh(A, v)
    return dot(v, A * v) / dot(v, v)
end