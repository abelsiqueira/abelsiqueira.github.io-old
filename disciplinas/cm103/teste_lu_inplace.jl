using FactCheck

# Se não tiver esse nome vai dar errado
include("lu_inplace.jl")

function dec_lu_pivot!(A; tol=1e-12)
    m,n = size(A)
    P = collect(1:m)
    for j = 1:n
        i_pivo, pivo = j, abs(A[j,j])
        for i = j+1:m
            if abs(A[P[i],j]) > pivo
                pivo = abs(A[P[i],j])
                i_pivo = i
            end
        end
        if pivo < tol
            error("pivo ≈ 0.0")
        end
        if i_pivo != j
            P[[i_pivo; j]] = P[[j; i_pivo]]
        end
        pj = P[j]
        for i = j+1:m
            pi = P[i]
            mij = A[pi,j]/A[pj,j]
            A[pi,j] = mij
            for k = j+1:n
                A[pi,k] -= mij*A[pj,k]
            end
        end
    end
    return P
end

facts("Vários exemplos aleatórios") do
  for n = 5:5:100
    A = rand(n,n)
    b = A*ones(n)
    LU = copy(A)
    P = dec_lu_pivot!(LU)
    for t = 1:10
      x = rand(n)
      y = copy(x)
      lu_mult(A, P, x)
      @fact A*y --> x
      b = A*ones(n)
      solve_lu(A, P, b)
      @fact ones(n) --> b
    end
  end
end
