# This file was generated, do not modify it. # hide
Ta = 10
T = [39.1262; 30.5367; 25.4514; 19.6129; 15.6515; 14.4767; 11.9281; 11.8655; 11.0895; 10.8207]
t = [0.0; 1.0; 2.0; 3.0; 4.0; 5.0; 6.0; 7.0; 8.0; 9.0]
scatter(t, T)
plot!(t->Ta, c=:green, l=:dash)
png(joinpath(@OUTPUT, "fig-quadmin40"))