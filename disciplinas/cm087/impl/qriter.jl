function auto_2x2(A)
  if size(A) != (2,2)
    error("Somente autovalores de 2x2")
  end
  t = A[1,1] + A[2,2]
  d = A[1,1]*A[2,2] - A[1,2]*A[2,1]
  D = t^2 - 4d
  D = D >= 0 ? sqrt(D) : sqrt(Complex(D))
  return (t + D)/2, (t - D)/2
end

function qriter(A)
  n = size(A, 1)
  if n == 1
    return A[:], 0
  elseif n == 2
    return [auto_2x2(A)...], 0
  end
  T = A
  qrs = 0
  while qrs <= 10_000
    for i = 1:n-1
      if abs(T[i+1,i]) < 1e-8
        λ1, qrs1 = qriter(T[1:i,1:i])
        λ2, qrs2 = qriter(T[i+1:end,i+1:end])
        return [λ1; λ2], qrs1 + qrs2 + qrs
      end
    end
    Q, R = qr(T)
    T = R * Q
    qrs += 1
  end
  return diag(T), qrs
end
