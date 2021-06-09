# This file was generated, do not modify it. # hide
f(x) = exp(x)
a, b = 0, 1
Iexata = MathConstants.e - 1
IPM = (b - a) * f( (a + b) / 2 )
ErroPM = Iexata - IPM
ErroRelPM = abs(ErroPM) / Iexata

function integral_PM(f, a, b)
    x = (a + b) / 2
    h = (b - a) / 2
    return 2h * f(x)
end

integral_PM(exp, 0, 1)