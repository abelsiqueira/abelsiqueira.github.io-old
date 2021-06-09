# This file was generated, do not modify it. # hide
using LinearAlgebra

function multAx1(y, A, x)
    m, n = size(A)
    for i = 1:m
        y[i] = 0.0
        for j = 1:n
            y[i] += A[i,j] * x[j]
        end
    end
end

function multAx2(y, A, x)
    m, n = size(A)
    for i = 1:m
        y[i] = 0.0
    end
    for j = 1:n
        for i = 1:m
            y[i] += A[i,j] * x[j]
        end
    end
end

n = 1000
A = rand(n, n)
x = rand(n)
y = zeros(n);

y1 = zeros(n)
y2 = zeros(n)
multAx1(y1, A, x)
multAx2(y2, A, x)
norm(y1 - y2)