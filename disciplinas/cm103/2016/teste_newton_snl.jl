using FactCheck

include("newton_snl.jl")

facts("Simples") do
  F(x) = [x[1]^2 + x[2]^2 - 4; x[1]*x[2] - 1]
  J(x) = [2x[1]  2x[2]; x[2]  x[1]]
  r = sqrt(2+sqrt(3))
  x, Fx, iter = newton_snl(F, J, [2.0;1.0])
  @fact norm(Fx, Inf) --> less_than(1e-6)
  @fact x --> roughly([r; 1/r])

  # (x - r1)(x - r2)(x - r3) = x^3-(r1+r2+r3)x^2+(r1r2+r1r3+r2r3)x-r1r2r3
  # = x^3 + ax^2 + bx + c
  r1, r2, r3 = sqrt(2), e, pi
  a, b, c = -r1-r2-r3, r1*r2+r1*r3+r2*r3, -r1*r2*r3
  F(x) = [x[1]+x[2]+x[3] + a;
          x[1]*x[2] + x[1]*x[3] + x[2]*x[3] - b;
          x[1]*x[2]*x[3] + c]
  J(x) = [1.0  1.0  1.0;
          x[2]+x[3]  x[1]+x[3]  x[1]+x[2];
          x[2]*x[3]  x[1]*x[3]  x[1]*x[2]]
  x, Fx, iter = newton_snl(F, J, [0.0; 1.0; 2.0])
  sort!(x)
  @fact norm(Fx, Inf) --> less_than(1e-6)
  @fact x[1] --> roughly(r1)
  @fact x[2] --> roughly(r2)
  @fact x[3] --> roughly(r3)
end

facts("Problemas") do
  F(x) = [x[1]^2 + x[2]^2 - 4; x[1]*x[2] - 1]
  J(x) = [2x[1]  2x[2]; x[2]  x[1]]
  @fact_throws newton_snl(F, J, [0.0; 0.0])
  x, Fx, iter = newton_snl(F, J, [2.0;1.0], maxiter=0)
  @fact iter --> 0
  @fact x --> [2.0; 1.0]
  x, Fx, iter = newton_snl(F, J, [2.0;1.0], maxiter=1)
  @fact iter --> 1
  @fact x --> [2.0; 0.5]
end
