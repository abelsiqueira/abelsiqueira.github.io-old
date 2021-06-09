# This file was generated, do not modify it. # hide
i = argmax(abs.(C[3:4,3])) + 2
C[ [i; 3], :] = C[ [3; i], :]
C