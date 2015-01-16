---
layout:     post
title:      "Selecting a Subgroup of CUTEst Problems According to Specific
Criteria"
date:       2015-01-16
categories: research
name:       cutest-problem-chooser
---
For some time now I've been using CUTEst or CUTEr,
and one of the common problems is selecting the problem you
want to use.

Unfortunately, the classification on the site is not updated,
and may contain errors, so I decided to create something,
with low requirements and high reliability, to select problems
according to a criteria.

[This work](https://github.com/abelsiqueira/cute-problem-chooser)
was created before, but used the site's classification as one
of the sources of information for the selection.
Now, I started from scratch, using Python, printing in JSON,
and running only `sifdecode`, and only when needed.

We mantain a JSON file with all information that can be obtained
running `sifdecode` (please correct me if I'm wrong).
This file only need to be updated when the SIF problems are updated.

Currently, I returned to this problem because a colleague needed
unconstrained problems such that the objective function is a sum of
squares, and all variables are free.
According to the classification, the two first letters needed to be
SU, and problems `BARD` and `ARGLALE` satisfied this condition.
However, problem `ARGLALE` is classified as SU, but it is not.
It is actually a problem with objective function 0 (or no objective
function), and with equality contraints only.
Both these forms are different formulations for the Nonlinear Least Squares
problem, but the CUTEst approach to it is very different, because
when they are a sum of squared function norms, we cannot obtain individual
function values and gradient, whereas in the other formulation,
there is already a function to access the individual constraints and gradients.

Hence, we needed to select all problems with no defined objective function,
with equality constraints, and only free variables.
The current implemented version of
[my scripts](https://github.com/abelsiqueira/cute-problem-chooser)
reflect this need.
So, if you need a different criteria met, you will need to hardcode it
using python. This is expected to change soon, if time permits,
to respond to command line arguments and/or user defined configurations
files.

If you are interested in working in this problems,
you can directly access the link above, work and make a pull request,
or e-mail me so we can work out the details of that I expected to make.
