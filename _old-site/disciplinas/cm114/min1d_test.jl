using FactCheck

include("min1d.jl")

for mtd in [min1d_quad, min1d_gold]
  println("# $mtd")
  facts("Funções quadráticas") do
    for t = 1:10
      a = 0.1 + rand()*100
      r = -200 + rand()*100
      f(x) = a*(x-r)^2 + 1.0
      x, ef, fx, nf = mtd(f, 2r)
      @fact x --> roughly(r, 1e-3)
      @fact fx --> roughly(1.0, 1e-6)
      @fact ef --> 0
      @fact nf --> less_than(1000)
    end
  end

  context("Funções específicas") do
    facts("f(x) = 1 + (x-2)^4") do
      x, ef, fx, nf = mtd(x->1.0+(x-2.0)^2, 2)
      @fact x --> roughly(2.0, 1e-3)
      @fact fx --> roughly(1.0, 1e-6)
      @fact ef --> 0
    end
    facts("f(x) = sin(2πx) + max(x^2-1,0)") do
      x, ef, fx, nf = mtd(x->sin(π*x) + max(x^2-1,0), -1)
      @fact x --> roughly(-0.5007, 1e-3)
      @fact fx --> roughly(-1.0, 1e-6)
      @fact ef --> 0
    end
  end
  context("Falhas") do
    facts("f(x) = x") do
      x, ef, fx, nf = mtd(x->x, 0)
      @fact abs(x) --> greater_than(1e6)
      @fact ef --> -1
    end
    facts("Number of f eval") do
      for maxnf = 3:15
        x, ef, fx, nf = mtd(x->0.01x^2, 100, maxnf=maxnf)
        @fact ef --> 1
        @fact nf --> maxnf
      end
    end
  end
  println("\n")
end
