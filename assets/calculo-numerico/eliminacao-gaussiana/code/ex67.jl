# This file was generated, do not modify it. # hide
A = [4.0 3 2; 2 5 -1; 1 -2 0]

m21 = 2 / 4
#L₂ - m₂₁L₁  equivale a E₂₁ × A
E21 = diagm(0 => ones(3)) # Identidate
E21[2,1] = -m21
E21