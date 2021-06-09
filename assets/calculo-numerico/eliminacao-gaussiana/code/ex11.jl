# This file was generated, do not modify it. # hide
function multAxs(y, rows, cols, vals, x)
    n = length(y)
    for i = 1:n
        y[i] = 0.0
    end
    nz = length(vals)
    for k = 1:nz
        i, j = rows[k], cols[k]
        y[i] += vals[k] * x[j]
    end
end

x = rand(4)
y = A * x
ys = zeros(4)
multAxs(ys, rows, cols, vals, x)