# Uma implementação de LU que substitui a matriz A com pivoteamento
"""
    A, P = lu_inplace!(A)

LU implementation with partial pivoting.
A is replaced with LU.
"""
function lu_inplace!(A; pivot=false)
  n = size(A, 1)
  if size(A, 2) != n
    error("Incompatible")
  end
  P = collect(1:n)

  for j = 1:n-1
    ajj, k = abs(A[j,j]), j
    if pivot
      for i = j+1:n
        aij = abs(A[i,j])
        if aij > ajj
          ajj, k = aij, i
        end
      end
      if k != j
        P[k], P[j] = P[j], P[k]
        for p = 1:n
          A[k,p], A[j,p] = A[j,p], A[k,p]
        end
      end
    end
    if ajj < 1e-12
      error("Pivot is too small")
    end
    for i = j+1:n
      A[i,j] /= A[j,j]
      for k = j+1:n
        A[i,k] -= A[i,j] * A[j,k]
      end
    end
  end

  return A, P
end
