# This file was generated, do not modify it. # hide
for x in Any["a", 'b', 0, 3.14, true, MathConstants.e, 3//4, im, ones(2), ones(2,2)]
    println("x: $x    Tipo: $(typeof(x))")
end