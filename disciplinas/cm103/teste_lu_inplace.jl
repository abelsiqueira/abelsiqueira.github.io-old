using FactCheck

# Se não tiver esse nome vai dar errado
include("lu_inplace.jl")
function dec_lu_pivot!(A; tol=1e-12)
    m,n = size(A)
    P = collect(1:m)
    for j = 1:n
        i_pivo, pivo = j, abs(A[j,j])
        for i = j+1:m
            if abs(A[i,j]) > pivo
                pivo = abs(A[i,j])
                i_pivo = i
            end
        end
        if pivo < tol
            error("pivo ≈ 0.0")
        end
        if i_pivo != j
            P[[i_pivo; j]] = P[[j; i_pivo]]
            A[[i_pivo; j],:] = A[[j; i_pivo],:]
        end
        for i = j+1:m
            mij = A[i,j]/A[j,j]
            A[i,j] = mij
            for k = j+1:n
                A[i,k] -= mij*A[j,k]
            end
        end
    end
    return P
end

facts("Vários exemplos aleatórios") do
  for n = 5:5:100
    A = rand(n,n)
    L, U, _ = lu(A)
    b = A*ones(n)
    LU = copy(A)
    P = dec_lu_pivot!(LU)
    for t = 1:10
      x = rand(n)
			b = rand(n)
      y = copy(x)

      lu_mult(LU, P, x)
      @fact A*y --> roughly(x)

      sol = A\b
      solve_lu(LU, P, b)
      @fact sol --> roughly(b)
    end
  end
end
