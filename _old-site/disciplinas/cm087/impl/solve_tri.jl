function solve_tri_inf(L, b)
  s = size(L)
  if s[1] != s[2]
    error("L is not square")
  end
  n = length(b)
  if s[1] != n
    error("System is not compatible")
  end
  x = zeros(n)
  for i = 1:n
    s = 0.0
    for j = 1:i-1
      s += L[i,j] * x[j]
    end
    if abs(L[i,i]) < 1e-12
      error("L is too close to singular")
    end
    x[i] = (b[i] - s)/L[i,i]
  end
  return x
end

function solve_tri_sup(U, b)
  s = size(U)
  if s[1] != s[2]
    error("U is not square")
  end
  n = length(b)
  if s[1] != n
    error("System is not compatible")
  end
  x = zeros(n)
  for i = n:-1:1
    s = 0.0
    for j = i+1:n
      s += U[i,j] * x[j]
    end
    if abs(U[i,i]) < 1e-12
      error("U is too close to singular")
    end
    x[i] = (b[i] - s)/U[i,i]
  end
  return x
end
