function seulu(A; pivot=false)
  n = size(A, 1)
  U = copy(A)
  L = eye(n)
  P = collect(1:n)

  for j = 1:n-1
    # Calcular o pivo
    # Fazer um for do i = j+1:n
    # Ver qual o maior abs(U[i,j])
    # Chamar o indice que satisfaz isso de k
    # Trocar as linhas i e k de U, de L, e de P, conforme necessário
    # Zerar aij para i = j+1,n
    for i = j+1:n
      mij = U[i,j]/U[j,j]
      L[i,j] = mij
      U[i,j+1:n] = U[i,j+1:n] - mij * U[j,j+1:n]
      U[i,j] = 0.0
    end
  end

  return L, U, P
end
