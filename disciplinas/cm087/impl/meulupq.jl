function meulu(A)
  n = size(A, 1)
  U = copy(A)
  L = eye(n)
  P = collect(1:n)
  Q = collect(1:n)

  for j = 1:n-1
    pivo, k, q = abs(U[j,j]), j, j
    for i = j:n
      for p = j:n
        uip = abs(U[i,p])
        if uip > pivo
          pivo, k, q = uip, i, p
        end
      end
    end
    if k != j
      I, J = [k;j], [j;k]
      P[I] = P[J]
      U[I,j:n] = U[J,j:n]
      L[I,1:j-1] = L[J,1:j-1]
    end
    if q != j
      I, J = [q;j], [j;q]
      Q[I] = Q[J]
      U[:,I] = U[:,J]
    end

    I = j+1:n
    L[I,j] = U[I,j]/U[j,j]
    U[I,j] = 0
    U[I,I] = U[I,I] - L[I,j] * U[j,I]'
  end

  return L, U, P, Q
end
