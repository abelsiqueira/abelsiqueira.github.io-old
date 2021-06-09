# This file was generated, do not modify it. # hide
m = C[2:4, 1] / C[1,1]         #Não se assustem
C[2:4,2:5] .-= m * C[1,2:5]'   # O código está com truques para ser curto
C[2:4,1] .= 0.0                #Mas o resultado é o mesmo que fazer individualmente
C                              #Lᵢ ← Lᵢ - mᵢ₁L₁, i = 2,3,4