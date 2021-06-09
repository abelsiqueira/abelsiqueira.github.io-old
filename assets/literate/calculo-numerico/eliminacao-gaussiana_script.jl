# This file was generated, do not modify it.

A = rand(3,3)
v = rand(3)
A * v

using LinearAlgebra

names(LinearAlgebra.BLAS) |> show

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

t₀ = time()
multAx1(y, A, x)
Δt = time() - t₀

t₀ = time()
multAx2(y, A, x)
Δt = time() - t₀

A = rand(3, 3)
A[:]

using SparseArrays

A = sprand(4, 4, 0.3)

Matrix(A)

rows, cols, vals = findnz(A)

[rows cols vals]

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

y - ys

A

A = sprand(1000, 1000, 0.001)
A = A * A'

A = rand(3, 3)
b = A * ones(3)

x = A\b

A = zeros(5,5) + 2I
for i = 1:4
    A[i,i+1] = 1
    A[i+1,i] = 1
end
A

b = A * ones(5)
A \ b

U = triu(rand(1:999, 10, 10)) / 1000

A = [3.0 1 2; -1 2 1; 1 1 4]

b = [6.0; 2; 6]

m21 = A[2,1] / A[1,1]

A[2,:] = A[2,:] - m21 * A[1,:]
b[2] = b[2] - m21 * b[1]

[A b]

m31 = A[3,1]/A[1,1]
A[3,:] = A[3,:] - m31*A[1,:]
b[3] = b[3] - m31*b[1]

[A b]

m32 = A[3,2]/A[2,2]
A[3,:] = A[3,:] - m32*A[2,:]
b[3] = b[3] - m32*b[2]

[A b]

x = zeros(3)
x[3] = b[3] / A[3,3]
x[2] = (b[2] - A[2,3] * x[3]) / A[2,2]
x[1] = (b[1] - A[1,3] * x[3] - A[1,2] * x[2]) / A[1,1]
x

function elim_gauss(A, b; diagtol = 1e-12)
    n = size(A, 1)
    for j = 1:n-1
        if abs(A[j,j]) < diagtol
            error("Diagonal quase nula")
        end
        for i = j+1:n
            mij = A[i,j] / A[j,j]
            A[i,1:j] .= 0.0
            A[i,j+1:n] -= mij * A[j,j+1:n]
            b[i] -= mij * b[j]
        end
    end
    return A, b
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0; 2; 6]
elim_gauss(A, b)

[A b]

A \ b

A = [0.0 1.0; 1.0 0.0]

b = ones(2)
elim_gauss(A, b)

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0; 2; 6]
A \ b

function sist_tri_sup(A, b)
    n = length(b)
    x = zeros(n)
    for j = n:-1:1
        if abs(A[j,j]) < 1e-14
            error("Não deu")
        end
        s = b[j]
        for k = j+1:n
            s -= A[j,k] * x[k]
        end
        x[j] = s / A[j,j]
    end
    return x
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0;2;6]
elim_gauss(A, b)
sist_tri_sup(A, b)

function resolve(A, b)
    Ac = copy(A)
    bc = copy(b)
    elim_gauss(Ac, bc)
    x = sist_tri_sup(Ac, bc)
    return x
end

A = rand(100, 100)
b = A * ones(100);

(100 * 100 + 100 + 100) * Float64.size / 1024

@time x = resolve(A, b);

@time x = A \ b;

function elim_gauss(A, b; diagtol = 1e-12)
    n = length(b)
    for j = 1:n-1
        ajj, bj = A[j,j], b[j]
        if abs(ajj) <= diagtol
            error("Diagonal muito próxima de 0")
        end
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j] = 0.0
            A[i,j+1:n] -= mij * A[j,j+1:n]
            b[i] -= mij * bj
        end
    end
    return A, b
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0;2;6]
elim_gauss(A, b)
A

A \ b

A = [1 1e-11; 1e-11 100]
b = A * ones(2)
resolve(A, b) .- 1

A = [1e-11 100; 1 1e-11]
b = A * ones(2)
resolve(A, b) .- 1

cond(A)

A = [0 1; 1 0]

ϵ = 1e-12
A = [ϵ 100; 1.0 ϵ]
B = copy(A)
b = A * ones(2)
elim_gauss(A, b, diagtol=0.0)

x = sist_tri_sup(A, b)
x - ones(2)

ϵ = 1e-15
((100 + ϵ) - 100) / ϵ

A = B[[2;1], :]

b = A * ones(2)
elim_gauss(A, b)
x = sist_tri_sup(A, b)
x - ones(2)

using LinearAlgebra
cond(A)

using SparseArrays

n = 100
A = spdiagm(0 => ones(n))
A[:,1] .= 1.0
A[1,:] .= 1.0
A[1,1] = n
A

b = A * ones(n)
elim_gauss(A, b)
A

n = 100
A = spdiagm(0 => ones(n))
A[:,1] .= 1
A[1,:] .= 1
A[1,1] = n
A[[1;n],:] = A[[n;1],:]
A

elim_gauss(A, b)
A

using Random
Random.seed!(0)
A = rand(4, 4) - rand(4, 4)
b = A * ones(4)
C = [A b]

i = argmax(abs.(C[:,1]))
C[ [i; 1], :] = C[ [1; i], :] # Lᵢ ↔ L₁
C

m = C[2:4, 1] / C[1,1]         #Não se assustem
C[2:4,2:5] .-= m * C[1,2:5]'   # O código está com truques para ser curto
C[2:4,1] .= 0.0                #Mas o resultado é o mesmo que fazer individualmente
C                              #Lᵢ ← Lᵢ - mᵢ₁L₁, i = 2,3,4

i = argmax(abs.(C[2:4,2])) + 1
C[ [i; 2], :] = C[ [2; i], :]
C

m = C[3:4, 2] / C[2,2]
C[3:4,3:5] .-= m * C[2,3:5]'
C[3:4,2] .= 0.0
C                              #Lᵢ ← Lᵢ - mᵢ₂L₂, i = 3,4

i = argmax(abs.(C[3:4,3])) + 2
C[ [i; 3], :] = C[ [3; i], :]
C

m = C[4,3] / C[3,3]
C[4,4:5] .-= m * C[3,4:5]
C[4,3] = 0.0
C

U = C[1:4, 1:4]
c = C[1:4, 5]
U \ c

A = rand(5,5)
j, k = 2, 5
A[[k;j],:] = A[[j;k],:]
A

function elim_gauss_pivot(A, b; diagtol = 1e-12)
    n = length(b)
    for j = 1:n-1
        pivo = 0.0
        k = j
        for i = j:n
            if abs(A[i,j]) > pivo
                pivo = abs(A[i,j])
                k = i
            end
        end
        if k != j
            A[ [j, k], :] = A[ [k, j], :]
            b[ [j, k] ]   = b[ [k, j] ]
        end
        ajj, bj = A[j,j], b[j]
        if abs(ajj) <= diagtol
            error("Diagonal muito próxima de 0")
        end
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j] = 0.0
            A[i,j+1:n] -= mij * A[j,j+1:n]
            b[i] -= mij * bj
        end
    end
    return A, b
end

A = rand(4, 4)
b = A * ones(4)
elim_gauss_pivot(A, b)

A \ b

A = [1e-12 100; 1 1e-12]
b = A * ones(2)
elim_gauss_pivot(A, b)

A \ b

A = [4.0 3 2; 2 5 -1; 1 -2 0]

m21 = 2 / 4
#L₂ - m₂₁L₁  equivale a E₂₁ × A
E21 = diagm(0 => ones(3)) # Identidate
E21[2,1] = -m21
E21

E21 * A

m31 = A[3,1] / A[1,1]
E31 = diagm(0 => ones(3)) # Identidate
E31[3,1] = -m31
E31

E31 * E21 * A

E31 * E21

A2 = E31 * E21 * A

m32 = A2[3,2] / A2[2,2]
E32 = diagm(0 => ones(3)) # Identidate
E32[3,2] = -m32
E32

E32 * A2

E32 * E31 * E21 * A

E32 * E31 * E21

inv(E32 * E31 * E21)

inv(E21)

inv(E31)

inv(E32)

inv(E21) * inv(E31) * inv(E32)

L = diagm(0 => ones(3))
L[2,1] = m21
L[3,1] = m31
L[3,2] = m32
L

U = E32 * E31 * E21 * A

L * U

L * U - A

b = A * ones(3)
(U \ (L \ b))

function declu(A::Matrix; diagtol = 1e-12)
    n = size(A, 1)
    for j = 1:n-1
        ajj = A[j,j]
        if abs(ajj) <= diagtol
            error("Diagonal muito próxima de 0")
        end
        Lj = A[j,j+1:n]
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j+1:n] = A[i,j+1:n] - mij * Lj
            A[i,j] = mij
        end
    end
    return tril(A,-1) + I, triu(A)
end

A = [3.0 1 2; -1 2 1; 1 1 4]
L, U = declu(copy(A))

L

U

L * U - A

A = rand(3, 3)
L, U = declu(copy(A))
norm(L * U - A)

A = rand(3, 3)

tril(A, -1) + I

triu(A)

function resolvelu(L, U, b)
    n = length(b)
    #Ly = b
    y = zeros(n)
    for i = 1:n
        s = 0.0
        for j = 1:i-1
            s += L[i,j] * y[j]
        end
        y[i] = b[i] - s
    end

    #Ux = y
    x = zeros(n)
    for i = n:-1:1
        s = 0.0
        for j = i+1:n
            s += U[i,j] * x[j]
        end
        x[i] = (y[i] - s) / U[i,i]
    end
    return x
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = A * ones(3)

L, U = declu(copy(A))
x = resolvelu(L, U, b)

A = [ 1  3  0  1;
      2  1  1  1;
     -3 -1 -1 -3;
     -1 -1  0 -1.0]
B = copy(A)
p = [1;2;3;4]

#pivô: a₃₁, L₁ ↔ L₃
p[3], p[1] = p[1], p[3]
A[3,:], A[1,:] = A[1,:], A[3,:]
A

m = A[2:4,1] / A[1,1]
A[2:4,1] = m
A[2:4,2:4] -= m * A[1,2:4]'
A

p'

#pivô: a₃₂, L₂ ↔ L₃
p[3], p[2] = p[2], p[3]
A[3,:], A[2,:] = A[2,:], A[3,:]
A

m = A[3:4,2] / A[2,2]
A[3:4,2] = m
A[3:4,3:4] -= m * A[2,3:4]'
A

#pivô: a₃₃, não há troca
m = A[4,3] / A[3,3]
A[4,3] = m
A[4,4] -= m * A[3,4]
A

L = tril(A, -1) + I

U = triu(A)

p'

P = Matrix(1.0I, 4, 4)[p,:]

P * B - L * U

B[p,:] - L * U

b = B * ones(4)

c = b[p]
y = L \ c
x = U \ y

function declupivot(A::Matrix; diagtol = 1e-12)
    n = size(A, 2)
    p = collect(1:n)
    for j = 1:n-1
        #Quem é o pivô
        pivo, k = abs(A[j,j]), j
        for i = j+1:n
            if abs(A[i,j]) > pivo
                pivo, k = abs(A[i,j]), i
            end
        end
        if pivo <= diagtol
            error("Matriz singular ou muito próxima de ser singular")
        end

        if k != j
            p[k], p[j] = p[j], p[k]
            A[[k;j],:] = A[[j;k],:]
        end
        ajj = A[j,j]
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j] = mij
            A[i,j+1:n] -= mij * A[j,j+1:n]
        end
    end
    return p
end

A = [ 1  3  0  1;
      2  1  1  1;
     -3 -1 -1 -3;
     -1 -1  0 -1.0]
p = declupivot(A)
A

