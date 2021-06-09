# This file was generated, do not modify it. # hide
fat_uma_linha(n::Int) = n == 0 ? 1 : n * fat_uma_linha(n - 1)