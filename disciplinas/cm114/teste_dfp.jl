using FactCheck

include("dfp.jl")

# A maneira errada e a certa dão o mesmo resultado
facts("Teste DFP Test") do
  n = 5
  v = rand(n)
  S, HY, Sigma, Rho = Any[], Any[], [], []
  @fact v --> roughly(DFP_prod(S, HY, Sigma, Rho, v))
  H = eye(n)
  s = rand(n)
  y = rand(n)
  Hy = y # H₀ = I
  H = H - y*y'/dot(y,y) + s*s'/dot(s,y)
  push!(S, s); push!(HY, Hy); push!(Sigma, dot(y, Hy)); push!(Rho, dot(s,y))
  @fact H * v --> roughly(DFP_prod(S, HY, Sigma, Rho, v))
  s = rand(n)
  y = rand(n)
  Hy = H*y
  H = H - (Hy)*(Hy)'/dot(y,Hy) + s*s'/dot(s,y)
  Hy = DFP_prod(S, HY, Sigma, Rho, y)
  push!(S, s); push!(HY, Hy); push!(Sigma, dot(y, Hy)); push!(Rho, dot(s,y))
  @fact H * v --> roughly(DFP_prod(S, HY, Sigma, Rho, v))
end

facts("Em quadráticas") do
  context("Simples") do
    f(x) = x[1]^2 + 4*x[2]^2
    x0 = ones(2)
    x, fx, gx, iter = simple_dfp_method(f, x0)
    @fact x --> roughly(zeros(2), 1e-6)
    @fact fx --> roughly(0.0, 1e-6)
    @fact gx --> less_than(1e-6)
  end

  context("Aleatórias") do
    n = 10
    for t = 1:10
      r = rand(n) - rand(n)
      A = rand(n); A = A*A' + eye(n)
      f(x) = 0.5*dot(x - r, A*(x-r)) + 1.0
      x, fx, gx, iter = simple_dfp_method(f, ones(n))
      @fact x --> roughly(r, 1e-6)
      @fact fx --> roughly(1.0, 1e-6)
      @fact gx --> less_than(1e-6)
    end
  end
end

context("Rosenbrock") do
  f(x) = (x[1] - 1)^2 + 100*(x[2] - x[1]^2)^2
  x0 = [-1.2; 1.0]
  # DFP with limited memory is bad
  x, fx, gx, iter = simple_dfp_method(f, x0, mem=50)
  println("iter = $iter")
  @fact x --> roughly(ones(2), 1e-6)
  @fact fx --> roughly(0.0, 1e-6)
  @fact gx --> less_than(1e-6)
end

nothing
