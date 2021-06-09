# This file was generated, do not modify it. # hide
m = C[3:4, 2] / C[2,2]
C[3:4,3:5] .-= m * C[2,3:5]'
C[3:4,2] .= 0.0
C                              #Lᵢ ← Lᵢ - mᵢ₂L₂, i = 3,4