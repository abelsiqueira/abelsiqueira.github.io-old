# This file was generated, do not modify it. # hide
A = zeros(5,5) + 2I
for i = 1:4
    A[i,i+1] = 1
    A[i+1,i] = 1
end
A