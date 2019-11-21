function newton (f::Function, fd::Function, x::Number; eps = 1e-6, kmax = 10000)
  fx = f(x)
  fdx = fd(x)
  k = 0
  while abs(fx) > eps
    if abs(fdx) < 1e-4*eps
      return x, f(x), k, 1
    end
    x -= fx/fdx
    fx = f(x)
    fdx = fd(x)
    k += 1
    if k >= kmax
      return x, f(x), k, -1
      break
    end
  end
  return x, f(x), k, 0
end
