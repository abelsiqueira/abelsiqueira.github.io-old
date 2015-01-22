---
layout:     post
title:      A Study in Julia
date:       2015-01-22
categories: research
name:       juliastudy
---
Today I begin a study in [Julia](http://julialang.org/).
This fantastic tool has syntax similar to that of Octave/Matlab,
but is much faster. Furthermore, the interface with functions
made in C and Fortran is much easier to accomplish, and since
most things in computational mathematics are on these languages,
this feature is wonderful.

My intented work is

  - make a simple julia and C interface, with auto-compiling
    and test on GitHub and Travis CI;
  - develop a nonlinear optimization tool completely in Julia,
    then improve the slow bits by using C and/or Fortran;
  - implement/improve the CUTEst interface
    [[1]](https://github.com/abelsiqueira/ugly),
    [[2]](https://github.com/abelsiqueira/CUTEst.jl),
    possibly creating a SIF converter.
  - if things work out, submit to [JuliaOpt](http://www.juliaopt.org/).

My work starts with the [Julia-C
Samples](https://github.com/abelsiqueira/julia-c-sample.git).
If you need me, I might be on `#julia` on IRC/freenode.
