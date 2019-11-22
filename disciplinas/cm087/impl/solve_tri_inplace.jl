function solve_lu_system!(b, LU)
  n = length(b)
  for i = 1:n
    s = 0.0
    for j = 1:i-1
      s += LU[i,j] * b[j]
    end
    b[i] = b[i] - s
  end

  for i = n:-1:1
    s = 0.0
    for j = i+1:n
      s += LU[i,j] * b[j]
    end
    if abs(LU[i,i]) < 1e-12
      error("LU is too close to singular")
    end
    b[i] = (b[i] - s)/LU[i,i]
  end
  return b
end
