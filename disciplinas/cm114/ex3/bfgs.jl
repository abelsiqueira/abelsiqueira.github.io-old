include("ldlt.jl")

function bfgs_update!(B, s, y)
  n = length(s)
  Bs = B*s
  a = dot(s,y)
  b = dot(s,Bs)
  for i = 1:n
    B[i,i] = B[i,i] - Bs[i]^2/b + y[i]^2/a
    for j = i+1:n
      B[i,j] = B[i,j] - Bs[i]*Bs[j]/b + y[i]*y[j]/a
      B[j,i] = B[i,j]
    end
  end
end

function bfgs_method(f, ∇f, x0; tol=1e-5, max_iter=1000, max_time=60)
  c₁ = 1e-4
  c₂ = 0.9
  n = length(x0)
  B = eye(n)

  iter = 0
  start_time = time()
  el_time = 0.0
  ef = 0
  x = copy(x0)
  fx = f(x)
  ∇fx = ∇f(x)
  while norm(∇fx) > tol
    L, D = ldlt(B)
    d = solve_ldlt(L, D, -∇fx)
    dot_∇fx_d = dot(∇fx,d)
    t = 1.0
    while f(x + t*d) > fx + c₁*t*dot_∇fx_d ||
        dot(∇f(x + t*d),d) < c₂*dot_∇fx_d
      t = 0.9*t
    end
    ∇fxold = ∇fx
    x = x + t*d
    fx = f(x)
    ∇fx = ∇f(x)
    iter += 1
    if iter >= max_iter
      ef = 1
      break
    end
    el_time = time() - start_time
    if el_time >= max_time
      ef = 2
      break
    end
    bfgs_update!(B, t*d, ∇fx-∇fxold)
  end

  return x, fx, ∇fx, ef, iter, el_time
end
