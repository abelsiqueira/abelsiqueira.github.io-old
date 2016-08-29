function elim_gauss(A, b)
  U, c = copy(A), copy(b)
  m,n = size(U)
  for j = 1:n
    for i = j+1:m
      mij = U[i,j]/U[j,j]
      U[i,j] = 0.0
      for k = j+1:n
        U[i,k] -= mij*U[j,k]
      end
      c[i] -= mij*c[j]
    end
  end
  return U, c
end

function tri_sup(U, c)
  n = length(c)
  x = copy(c)
  for i = n:-1:1
    for j = i+1:n
      x[i] -= U[i,j]*x[j]
    end
    x[i] = x[i]/U[i,i]
  end
  return x
end
