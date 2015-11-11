using CUTEst

# Isto é para meu método
include("methods.jl")

if length(ARGS) < 1
  println("ERRO: Para chamar este programa use")
  println("julia cutest.jl PROBLEMA")
  println("Onde PROBLEMA é algum dos problemas do CUTEst")
end

problem = ascii(ARGS[1])

println("Resolvendo problema $problem")

nlp = CUTEstModel(problem)

f(x) = obj(nlp, x)
∇f(x) = grad(nlp, x)
H(x) = hess(nlp, x)
x₀ = nlp.meta.x0

x, fx, ∇fx, ef, iter, el_time = hess_mod_line_search(f, ∇f, H, x₀,
    line_search=:exact)
println("x = $x")
println("‖∇fx‖ = $(norm(∇fx))")
println("iter = $iter")
println("ef = $ef")
