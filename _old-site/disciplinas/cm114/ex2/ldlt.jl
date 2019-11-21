# LDLᵀ factorization

function ldlt(A)
  n = size(A,1)
  L = zeros(A)
  D = zeros(n)
  for j = 1:n
    s = 0.0
    for k = 1:j-1
      s += L[j,k]^2*D[k]
    end
    D[j] = A[j,j] - s
    L[j,j] = 1.0
    for i = j+1:n
      s = 0.0
      for k = 1:j-1
        s += L[i,k]*L[j,k]*D[k]
      end
      L[i,j] = (A[i,j] - s)/D[j]
    end
  end
  return L, D
end

function solve_ldlt(L, D, b)
  n = length(b)
  x = zeros(b)
  for i = 1:n
    s = 0.0
    for j = 1:i-1
      s += L[i,j]*x[j]
    end
    x[i] = b[i] - s
  end
  x = x./D
  for i = n:-1:1
    s = 0.0
    for j = i+1:n
      s += L[j,i]*x[j]
    end
    x[i] = x[i] - s
  end
  return x
end
